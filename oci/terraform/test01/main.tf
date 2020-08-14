
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
    provisioner_command = "sleep 20"
  }
}

module "tf_vcn" {
  source = "./modules/vcn"

  oci_compartment = {
    tenancy_ocid   = var.tenancy_ocid
    compartment_id = module.tf_compartment.compartment_id
  }

  oci_vcn_dns_label = "dnstf"

  oci_vcn = {
    cidr_block          = "10.10.0.0/16"
    display_name        = "tf_vcn_webserver"
    dns_label           = "vcntf"
    provisioner_command = "sleep 5"
  }

  oci_security_list = {
    display_name = "tf_security_list"
  }

  oci_internet_gateway = {
    display_name = "tf_igw"
  }

  oci_route_table = {
    display_name            = "tf_rt1"
    route_rules_destination = var.all_cidr_blocks
  }

  subnet_count = 2
  oci_vcn_subnet = {
    subnet_newbits      = 4
    display_name        = "tf_subnet1-AD"
    provisioner_command = "sleep 5"
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