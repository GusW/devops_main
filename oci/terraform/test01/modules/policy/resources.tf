
resource "oci_identity_policy" "tf_allow_object_storage_lifecycle" {
  name           = var.oci_policy.name
  description    = var.oci_policy.description
  compartment_id = var.oci_policy.compartment_id
  statements     = var.oci_policy_statements
  freeform_tags  = var.oci_freeform_tags
}
