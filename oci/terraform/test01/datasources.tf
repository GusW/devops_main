
data "oci_identity_availability_domains" "ashburn" {
  compartment_id = var.tenancy_ocid
}

data "oci_objectstorage_namespace" "user_namespace" {
  compartment_id = var.compartment_ocid
}

resource "random_id" "tf_id" {
  byte_length = 2
}
