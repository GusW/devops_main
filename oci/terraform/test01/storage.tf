resource "oci_objectstorage_bucket" "bucket_tf" {
  #Required
  compartment_id = var.compartment_ocid
  name           = "bucket-${random_id.tf_id.dec}"
  namespace      = data.oci_objectstorage_namespace.user_namespace.namespace
  freeform_tags  = local.common_tags
  depends_on     = [oci_identity_policy.tf_allow_object_storage_lifecycle]
}

resource "oci_objectstorage_object" "hello-world-object-in-bucket" {
    #Required
    bucket = oci_objectstorage_bucket.bucket_tf.name
    content = "Hello Galaxy"
    namespace = data.oci_objectstorage_namespace.user_namespace.namespace
    object = "my-new-object"
    content_type = "text/text"
}

# report on the managed bucket resource by printing its OCID
output "show-new-bucket" {
  value = oci_objectstorage_bucket.bucket_tf.bucket_id
}

# report on the managed object resource by printing the full object
output "show-new-object" {
  value = oci_objectstorage_object.hello-world-object-in-bucket
}

# report on the managed object resource by printing the full object
output "show-hello-world-object" {
  value = data.oci_objectstorage_object.read-hello-world-object
}

