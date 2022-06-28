# https://github.com/ssbostan/terraform-awesome

terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.11"
    }
  }
}
