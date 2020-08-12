# COMPARTMENT
variable "tf_compartment" {
  description = "Terraform Training Compartment"
  type = map(string)
  default = {
    tenancy_ocid = "Default-Tenancy_OCID"
    compartment_id = "Default-Compartment-ID"
  }
}

# NETWORK
variable "dns_label_vcn" {
  default = "dnsvcntf"
}

variable "vcn_tf_details" {
  description = "All the Virtual Cloud Network vcn_tf resource related attributes"
  type = map(string)
  default = {
    cidr_block          = "10.10.0.0/16"
    display_name        = "tf_vcn_webserver"
    dns_label           = "tfvcn"
    provisioner_command = "sleep 5"
  }
}

variable "igw_tf_details" {
  description = "All the Internet Gateway igw_tf resource related attributes"
  type = map(string)
  default = {
    display_name        = "tf_igw"
  }
}

variable "rt1_tf_details" {
  description = "All the Route Table rt1_tf resource related attributes"
  type = map(string)
  default = {
    display_name = "tf_rt1"
    route_rules_destination = "0.0.0.0/0"
  }
}

variable "subnet1_tf_details" {
  description = "All the Subnet 1 subnet1_tf resource related attributes"
  type = map(string)
  default = {
    cidr_block          = "10.10.10.0/24"
    display_name        = "tf_subnet1-AD1"
    provisioner_command = "sleep 5"
  }
}

variable "subnet2_tf_details" {
  description = "All the Subnet 2 subnet2_tf resource related attributes"
  type = map(string)
  default = {
    cidr_block          = "10.10.15.0/24"
    display_name        = "tf_subnet2-AD2"
    provisioner_command = "sleep 5"
  }
}