# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "redis_image" {
  name = "redis:latest"
}
resource "docker_container" "redis_container" {
  name    = "redis_container"
  image   = docker_image.redis_image.name
  command = ["redis-server", "--appendonly yes"]
  ports {
    internal = 6379
    external = 6379
    ip       = "0.0.0.0"
  }
  memory     = 1024
  cpu_shares = 2

  labels {
    label = "container.docker.com/created-by"
    value = "Terraform Awesome"
  }
  tmpfs = {
    "/data" = "rw,noexec,nosuid"
  }
}