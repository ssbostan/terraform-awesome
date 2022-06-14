# https://github.com/ssbostan/terraform-awesome

resource "tls_private_key" "nginx_https_tls_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "acme_registration" "reg" {
  account_key_pem = tls_private_key.nginx_https_tls_key.private_key_pem
  email_address   = "admin@devops.com"
}

resource "acme_certificate" "certificate" {
  account_key_pem           = acme_registration.reg.account_key_pem
  common_name               = "www.devops.com"
  subject_alternative_names = ["devops.com"]
  http_challenge {
    port         = "80"
    proxy_header = "Forwarded"
  }
}

resource "local_file" "nginx_https_tls_key" {
  filename = "tls.key"
  content  = tls_private_key.nginx_https_tls_key.private_key_pem
}

resource "local_file" "nginx_https_tls_cert" {
  filename = "tls.crt"
  content  = acme_certificate.certificate.account_key_pem
}