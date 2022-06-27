# https://github.com/ssbostan/terraform-awesome

variable "email_address" {
  description = "This is an email for letsencrypt registration."
  type = string
}

variable "domain_name" {
  description = "Your website domain name."
  type = string
}

variable "challenge_port" {
  type    = number
  default = 80
}