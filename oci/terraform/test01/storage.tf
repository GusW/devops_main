resource "oci_objectstorage_bucket" "bucket_tf" {

  #Required
  compartment_id = var.compartment_ocid
  name           = "bucket-${random_id.tf_id.dec}"
  namespace      = data.oci_objectstorage_namespace.user_namespace.namespace
  freeform_tags  = local.common_tags
  depends_on     = [oci_identity_policy.tf_allow_object_storage_lifecycle]
}
