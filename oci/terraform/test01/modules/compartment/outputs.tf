
output "tenancy_ocid" {
  value = var.tenancy_ocid
}

output "compartment_id" {
  value = oci_identity_compartment.tf_training_compartment.id
}