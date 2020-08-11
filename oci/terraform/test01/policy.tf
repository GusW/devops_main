resource "oci_identity_policy" "tf_allow_object_storage_lifecycle" {
  name           = "terraform-object-family-${random_id.tf_id.dec}"
  description    = "policy created by terraform for training"
  compartment_id = module.tf_compartment.compartment_id
  statements     = ["Allow service objectstorage-${var.region} to manage object-family in compartment id ${module.tf_compartment.compartment_id}"]
  freeform_tags  = local.common_tags
}
