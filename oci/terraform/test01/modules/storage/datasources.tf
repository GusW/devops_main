
data "oci_objectstorage_object" "read-hello-world-object" {
  bucket    = oci_objectstorage_object.hello-world-object-in-bucket.bucket
  namespace = oci_objectstorage_object.hello-world-object-in-bucket.namespace
  object    = oci_objectstorage_object.hello-world-object-in-bucket.object
}
