variable "containers" {
  type = map
  default = {
    "nginx" = {
      "image" : "nginx:alpine"
      "memory" : "1024"
      "env" : []
      "restart" : "always"
    },
    "redis" = {
      "image" : "redis:latest"
      "memory" : "512"
      "env" : []
      "restart" : "unless-stopped"
    }
    "mysql" = {
      "image" : "mysql:8"
      "memory" : "1024"
      "env" : [
        "MYSQL_ROOT_PASSWORD = root",
        "MYSQL_DATABASE = test"
      ]
      "restart" : "no"
    }
  }
}

### this varriable trigger the generic template for docker containers