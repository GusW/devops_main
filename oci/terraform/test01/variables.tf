
# DEFAULT
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "compartment_ocid" {}
variable "ssh_public_key" {}
variable "region" {}

variable "disable_auto_retries" {
  description = "Disable auto retries"
  type        = bool
  default     = true
}

variable "all_cidr_blocks" {
  description = "IPv4 CIDR range"
  type        = string
  default     = "0.0.0.0/0"
}