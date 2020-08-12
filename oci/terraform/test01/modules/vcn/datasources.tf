data "oci_identity_availability_domains" "targetRegion" {
  compartment_id = var.tf_compartment.tenancy_ocid
}
