# https://github.com/ssbostan/terraform-awesome

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

provider "acme" {
  server_url = "https://acme-v02.api.letsencrypt.org/directory"
}