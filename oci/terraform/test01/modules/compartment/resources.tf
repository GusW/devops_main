resource "oci_identity_compartment" "tf_training_compartment" {
    #Required
    compartment_id = var.tf_training_compartment.root_compartment_id
    description = var.tf_training_compartment.description
    name = var.tf_training_compartment.name

    #Optional
    #defined_tags = {"Operations.CostCenter"= "42"}
    #freeform_tags = {"Department"= "Finance"}
}

