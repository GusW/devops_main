provider "oci" {
  tenancy_ocid         = var.tenancy_ocid
  user_ocid            = var.user_ocid
  fingerprint          = var.fingerprint
  private_key_path     = var.private_key_path
  region               = var.region
  disable_auto_retries = "true"
}

output "ADprint" {
  value = lookup(data.oci_identity_availability_domains.ashburn.availability_domains[0],"name")
}
