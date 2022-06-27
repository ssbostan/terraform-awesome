# https://github.com/ssbostan/terraform-awesome

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~>2.16.0"
    }
    acme = {
      source  = "vancluever/acme"
      version = "~>2.9.0"
    }
  }
}
