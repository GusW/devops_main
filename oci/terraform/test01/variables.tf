
# Provider
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

# VCN
variable "cidr_blocks" {
  description = "IPv4 CIDR range"
  type        = map(string)
  default     = {
    all = "0.0.0.0/0"
    class_a = "10.10.0.0/16"
  }
}

variable "dns_label" {
  description = "Domain Name Server label"
  type = string
  default = "dns"
}

variable "vcn" {
  description = "VCN params"
  type = map(string)
  default = {
    display_name = ""
    dns_label = "vcn"
    security_list_name = "security_list"
    internet_gateway_name = "internet_gateway"
    route_table_name = "route_table"
  }
}

variable "subnet" {
  description = "Subnet params"
  type = map(number)
  default = {
    count = 2
    new_bits = 4
  }
}

variable "subnet_name_prefix" {
  description = "Prefix for naming subnets"
  type = string
  default = "subnet"
}

# Provisioners
variable "command" {
  description = "Provisioner commands"
  type = map(string)
  default = {
    sleep_5 = "sleep 5"
    sleep_20 = "sleep 20"
  }
}