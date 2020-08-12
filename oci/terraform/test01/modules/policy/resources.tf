
resource "oci_identity_policy" "tf_allow_object_storage_lifecycle" {
  name           = var.tf_policy.name
  description    = var.tf_policy.description
  compartment_id = var.tf_policy.compartment_id
  statements     = var.tf_policy_statements
  freeform_tags  = var.tf_freeform_tags
}
