# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_pod" "nginx_exec_readiness" {
  metadata {
    name      = "nginx-exec-readiness"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "nginx-exec-readiness"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  spec {
    container {
      name  = "nginx-exec-readiness"
      image = "nginx:latest"
      readiness_probe {
        exec {
         command = ["cat", "/etc/passwd"]
     }
        initial_delay_seconds = 10
        timeout_seconds = 10
        period_seconds = 10
        failure_threshold = 3
      }
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

