## Not using name_prefix and name_suffix since there is only one object being created.

# variable "name_prefix" {
#   description = "String to prefix on object names"
#   type = "string"
# }

# variable "name_suffix" {
#   description = "String to append to object names. This is optional, so start with dash if using"
#   type = "string"
#   default = ""
# }

variable "name" {
  description = "The name of the group in IAM"
  type        = string
}

variable "path" {
  description = "The path of the group in IAM"
  type        = string
  default     = "/"
}

variable "user_self_service" {
  description = "True/False to add inline permissions for user self service to the group. Default is True"
  type        = string
  default     = true
}

