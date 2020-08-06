# DEFAULT
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "compartment_ocid" {}
variable "ssh_public_key" {}
variable "region" {}

# NETWORK
variable "vcn_cidr_block" {
  default = "10.10.0.0/16"
}

variable "dns_label_vcn" {
  default = "dnsvcntf"
}

variable "subnet_cidr_w1" {
  default = "10.10.10.0/24"
}

variable "subnet_cidr_w2" {
  default = "10.10.20.0/24"
}
