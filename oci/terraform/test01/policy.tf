resource "oci_identity_policy" "tf_allow_object_storage_lifecycle" {
  name           = "terraform-object-family-${random_id.tf_id.dec}"
  description    = "policy created by terraform for training"
  compartment_id = var.compartment_ocid
  statements     = ["Allow service objectstorage-${var.region} to manage object-family in compartment id ${var.compartment_ocid}"]
  freeform_tags  = local.common_tags
}
