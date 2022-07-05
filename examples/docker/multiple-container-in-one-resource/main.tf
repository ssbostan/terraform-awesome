resource "docker_container" "containers" {
  for_each = var.containers
  name     = each.key
  memory   = each.value.memory
  image    = each.value.image
  restart  = each.value.restart
  env      = each.value.env
}

#### this is generic template