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
      image = "nginx:alpine"
      readiness_probe {
        initial_delay_seconds = 3
        period_seconds        = 10
        failure_threshold     = 5
        exec {
          command = ["kill -0", "1"]
        }
      }
    }
  }
}
