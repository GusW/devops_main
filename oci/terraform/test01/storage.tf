resource "oci_objectstorage_bucket" "bucket_tf" {
  #Required
  compartment_id = module.tf_compartment.compartment_id
  name           = "bucket-${random_id.tf_id.dec}"
  namespace      = data.oci_objectstorage_namespace.user_namespace.namespace
  freeform_tags  = local.common_tags
  depends_on     = [module.tf_policy_object_storage, module.tf_compartment]
}

resource "oci_objectstorage_object" "hello-world-object-in-bucket" {
    #Required
    bucket = oci_objectstorage_bucket.bucket_tf.name
    content = "Hello Galaxy"
    namespace = data.oci_objectstorage_namespace.user_namespace.namespace
    object = "my-new-object"
    content_type = "text/text"
}

