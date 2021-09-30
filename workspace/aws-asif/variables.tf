# variable "AWS_ACCESS_KEY_ID" {
#   type = string
#   description = "AWS Access Key ID used to connect to provider."
# }

# variable "AWS_SECRET_ACCESS_KEY" {
#   type = string
#   description = "AWS Secret Access Key used to connect to provider."
# }

variable "access_key" {
  type        = string
  description = "AWS Access Key ID used to connect to provider."
}

variable "secret_key" {
  type        = string
  description = "AWS Secret Access Key used to connect to provider."
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "linux_ami" {
  type    = string
  default = "ami-0bfd41cde731af7cb"
}
