
data "oci_identity_availability_domains" "ashburn" {
  compartment_id = var.tenancy_ocid
}

data "oci_objectstorage_namespace" "user_namespace" {
  compartment_id = module.tf_compartment.compartment_id
}

resource "random_id" "tf_id" {
  byte_length = 2
}

data "oci_objectstorage_object" "read-hello-world-object" {
  bucket = oci_objectstorage_object.hello-world-object-in-bucket.bucket
  namespace = oci_objectstorage_object.hello-world-object-in-bucket.namespace
  object = oci_objectstorage_object.hello-world-object-in-bucket.object
}
