# OCI default required values
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}

# COMPARTMENT
variable "tf_training_compartment" {
    description = "Related Terraform compartment details"
    type = map(string)
    default = {
        root_compartment_id = "ocid1.compartment.oc1..aaaaaaaabyabdq4b7oyzojfg2mywq3aanvytk5pclfmxjxpalakbjonplgpa"
        description = "Terraform Training Compartment"
        name = "tf_new_training_compartment"
    }
}
