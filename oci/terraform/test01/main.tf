
locals {
  common_tags = {
    Project = "Terraform Training"
  }
}

resource "random_id" "tf_id" {
  byte_length = 2
}

module "tf_compartment" {
  source = "./modules/compartment"

  oci_compartment = {
    root_compartment_id = var.compartment_ocid
    description         = "Terraform Training Compartment ${terraform.workspace}"
    name                = "tf_training_compartment_${terraform.workspace}"
    provisioner_command = var.command.sleep_20
  }
}

module "tf_vcn" {
  source = "./modules/vcn"

  oci_compartment = {
    tenancy_ocid   = var.tenancy_ocid
    compartment_id = module.tf_compartment.compartment_id
  }

  oci_vcn_dns_label = "${var.dns_label}tf"

  oci_vcn = {
    cidr_block          = var.cidr_blocks.class_a
    display_name        = "tf_${var.vcn.display_name}_webserver"
    dns_label           = "${var.vcn.dns_label}tf"
    provisioner_command = var.command.sleep_5
  }

  oci_security_list = {
    display_name = "tf_${var.vcn.security_list_name}"
  }

  oci_internet_gateway = {
    display_name = "tf_${var.vcn.internet_gateway_name}"
  }

  oci_route_table = {
    display_name            = "tf_${var.vcn.route_table_name}_1"
    route_rules_destination = var.cidr_blocks.all
  }

  subnet_count = var.subnet.count
  oci_vcn_subnet = {
    subnet_newbits      = var.subnet.new_bits
    display_name        = "tf_${var.subnet_name_prefix}-AD"
    provisioner_command = var.command.sleep_5
  }

  depends_on = [module.tf_compartment]
}

module "tf_policy_object_storage" {
  source = "./modules/policy"

  oci_policy = {
    name           = "terraform-object-family-${random_id.tf_id.dec}"
    description    = "policy created by terraform for training"
    compartment_id = module.tf_compartment.compartment_id
  }
  oci_policy_statements = ["Allow service objectstorage-${var.region} to manage object-family in compartment id ${module.tf_compartment.compartment_id}"]
  oci_freeform_tags     = local.common_tags

  depends_on = [module.tf_compartment]
}

module "tf_object_storage" {
  source = "./modules/storage"

  oci_bucket = {
    compartment_id = module.tf_compartment.compartment_id
    name           = "bucket-${random_id.tf_id.dec}"
    namespace      = data.oci_objectstorage_namespace.user_namespace.namespace
    freeform_tags  = local.common_tags
  }

  oci_object = {
    bucket       = module.tf_object_storage.bucket_name
    content      = "Hello Galaxy"
    namespace    = data.oci_objectstorage_namespace.user_namespace.namespace
    object       = "my-new-object"
    content_type = "text/text"
  }

  depends_on = [module.tf_compartment, module.tf_policy_object_storage]
}