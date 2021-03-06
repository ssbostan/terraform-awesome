# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_pod" "nginx_pod" {
  metadata {
    name      = "nginx"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "nginx"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }

  spec {
    container {
      name  = "nginx"
      image = "nginx:latest"

      port {
        container_port = 80
      }

      readiness_probe {
        http_get {
          path = "/"
          port = 80
        }
      }
    }
  }
}
