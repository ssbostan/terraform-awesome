# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "awesome_nginx" {
  image = docker_image.nginx.name
  name  = "awesome_nginx"
  volumes {
    host_path      = abspath("nginx.conf")
    container_path = "/etc/nginx/nginx.conf"
  }
  volumes {
    host_path      = abspath("tls.crt")
    container_path = "/etc/nginx/certs/tls.crt"
  }
  volumes {
    host_path      = abspath("tls.key")
    container_path = "/etc/nginx/certs/tls.key"
  }
  ports {
    internal = "80"
    external = "80"
  }
  ports {
    internal = "443"
    external = "443"
  }

  depends_on = [
    local_file.nginx_https_tls_key,
    local_file.nginx_https_tls_cert
  ]
}