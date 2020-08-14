
resource "oci_identity_compartment" "oci_compartment" {
  compartment_id = var.oci_compartment.root_compartment_id
  description    = var.oci_compartment.description
  name           = var.oci_compartment.name

  provisioner "local-exec" {
    command = var.oci_compartment.provisioner_command
  }
}

