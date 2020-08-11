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