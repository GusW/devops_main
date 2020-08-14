
data "oci_identity_availability_domains" "targetRegion" {
  compartment_id = var.oci_compartment.tenancy_ocid
}
