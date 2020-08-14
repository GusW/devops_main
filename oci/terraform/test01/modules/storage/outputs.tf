output "bucket_name" {
  value = oci_objectstorage_bucket.bucket_tf.name
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