locals {
  common_tags = {
    Project = "Terraform Training"
  }
}

module "tf_compartment" {
  source      = "./modules/compartment"

  tenancy_ocid = var.tenancy_ocid
  user_ocid = var.user_ocid
  fingerprint = var.fingerprint
  private_key_path = var.private_key_path
  region = var.region
}

module "tf_vcn" {
  source      = "./modules/vcn"

  tf_compartment = {
    tenancy_ocid = module.tf_compartment.tenancy_ocid
    compartment_id = module.tf_compartment.compartment_id
  }
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
}