
# https://github.com/ssbostan/terraform-awesome

resource "tls_private_key" "example_rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "key" {
  content         = tls_private_key.example_rsa.private_key_pem
  filename        = "${path.module}/myKey.pem"
  file_permission = "0400"
}