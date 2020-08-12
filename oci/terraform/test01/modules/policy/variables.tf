
variable "tf_policy" {
  description = "Default policy structure"
  type = map(string)
  default = {
    name           = "A-default-policy-name"
    description    = "A-default-policy-description"
    compartment_id = "A-default-compartment-id"
  }
}

variable "tf_policy_statements" {
  description = "Default policy structure"
  type = list(string)
  default = ["A-default-statement-1", "A-default-statement-2"]
}

variable "tf_freeform_tags" {
  description = "Default tagging structure"
  type = map(string)
  default = {
    A-default-tag-key-1 = "A-default-tag-value-1"
    A-default-tag-key-2 = "A-default-tag-value-2"
  }
}