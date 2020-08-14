
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

variable "oci_bucket" {
  description = "OCI Object Storage Bucket params"
  default = {
    compartment_id = "A-default-compartment-id"
    name           = "A-default-bucket-name"
    namespace      = "A-default-name-space"
    freeform_tags = {
      A-default-key = "A-default-value"
    }
  }
}

variable "oci_object" {
  description = "OCI Object Storage Object params"
  type        = map(string)
  default = {
    bucket       = "A-default-bucket-name"
    content      = "A-default-content"
    namespace    = "A-default-namespace"
    object       = "A-default-object"
    content_type = "A-default-content-type"
  }
}

