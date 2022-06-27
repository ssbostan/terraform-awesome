# https://github.com/ssbostan/terraform-awesome

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "reg" {
  account_key_pem = tls_private_key.private_key.private_key_pem
  email_address   = var.email_address
}

resource "acme_certificate" "certificate" {
  account_key_pem = acme_registration.reg.account_key_pem
  common_name     = var.domain_name

  http_challenge {
    port = var.challenge_port
  }
}

resource "local_file" "nginx_https_tls_key" {
  filename = "tls.key"
  content  = acme_certificate.certificate.private_key_pem
}

resource "local_file" "nginx_https_tls_cert" {
  filename = "tls.crt"
  content  = acme_certificate.certificate.certificate_pem
}

