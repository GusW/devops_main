locals {
  common_tags = {
    Project = "Terraform Training"
  }
}

resource "random_id" "tf_id" {
  byte_length = 2
}

module "tf_compartment" {
  source      = "./modules/compartment"

  oci_compartment = {
    root_compartment_id = var.compartment_ocid
    description = "Terraform Training Compartment ${terraform.workspace}"
    name = "tf_training_compartment_${terraform.workspace}"
    provisioner_command = "sleep 20"
  }
}

module "tf_vcn" {
  source      = "./modules/vcn"

  tf_compartment = {
    tenancy_ocid = var.tenancy_ocid
    compartment_id = module.tf_compartment.compartment_id
  }

  depends_on     = [module.tf_compartment]
}

module "tf_policy_object_storage" {
  source      = "./modules/policy"

  tf_policy = {
    name               = "terraform-object-family-${random_id.tf_id.dec}"
    description        = "policy created by terraform for training"
    compartment_id     = module.tf_compartment.compartment_id
  }
  tf_policy_statements = ["Allow service objectstorage-${var.region} to manage object-family in compartment id ${module.tf_compartment.compartment_id}"]
  tf_freeform_tags     = local.common_tags

  depends_on     = [module.tf_compartment]
}