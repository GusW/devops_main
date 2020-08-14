# COMPARTMENT
# TODO does it need to be declared here?
variable "oci_compartment" {
  description = "OCI Compartment params"
  type        = map(string)
  default = {
    tenancy_ocid   = "Default-Tenancy_OCID"
    compartment_id = "Default-Compartment-ID"
  }
}

# NETWORK
variable "oci_vcn_dns_label" {
  description = "Domain Name Server Label for OCI Virtual Cloud Network"
  type        = string
  default     = "A-default-dns-label"
}

variable "oci_vcn" {
  description = "All OIC Virtual Cloud Network vcn_tf params"
  type        = map(string)
  default = {
    cidr_block          = "A-default-cidr-block"
    display_name        = "A-default-display-name"
    dns_label           = "A-default-dns-label"
    provisioner_command = "A-default-provisioner-command"
  }
}

variable "oci_internet_gateway" {
  description = "OCI Internet Gateway params"
  type        = map(string)
  default = {
    display_name = "A-default-display-name"
  }
}

variable "oci_route_table" {
  description = "OCI Route Table params"
  type        = map(string)
  default = {
    display_name            = "A-default-display-name"
    route_rules_destination = "A-default-CIDR-block"
  }
}

variable "subnet_count" {
  description = "Number of Subnets to be added in the VCN"
  type        = number
  default     = 0
}

variable "oci_vcn_subnet" {
  description = "OCI VCN Subnet params"
  type        = map(string)
  default = {
    subnet_newbits      = "A-default-subnet-newbits"
    display_name        = "A-default-display-name"
    provisioner_command = "A-default-provisioner-command"
  }
}