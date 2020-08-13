//# OCI default required values
//variable "tenancy_ocid" {}
//variable "user_ocid" {}
//variable "fingerprint" {}
//variable "private_key_path" {}
//variable "region" {}

variable "oci_compartment" {
    description = "Related Terraform compartment details"
    type = map(string)
    default = {
        root_compartment_id = "A-default-root-compartment-id"
        description = "A-default-compartment-description"
        name = "A-default-compartment-name"
        provisioner_command = "A-default-provisioner-command"
    }

}
