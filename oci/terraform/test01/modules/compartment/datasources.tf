data "oci_identity_compartment" "tf-compartment"{
  id = oci_identity_compartment.tf_training_compartment.id
}