# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_pod" "nginx" {
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
        name           = "http"
        protocol       = "TCP"
        container_port = 80
      }
      port {
        name           = "https"
        protocol       = "TCP"
        container_port = 443
      }
    }
  }
}
