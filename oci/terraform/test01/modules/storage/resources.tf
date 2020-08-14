resource "oci_objectstorage_bucket" "bucket_tf" {
  #Required
  compartment_id = var.oci_bucket.compartment_id
  name           = var.oci_bucket.name
  namespace      = var.oci_bucket.namespace
  freeform_tags  = var.oci_bucket.freeform_tags
}

resource "oci_objectstorage_object" "hello-world-object-in-bucket" {
  #Required
  bucket       = var.oci_object.bucket
  content      = var.oci_object.content
  namespace    = var.oci_object.namespace
  object       = var.oci_object.object
  content_type = var.oci_object.content_type
}

