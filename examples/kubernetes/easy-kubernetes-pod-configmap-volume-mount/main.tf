# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_config_map" "nginx_conf" {
  metadata {
    name      = "nginx-conf"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "nginx-conf"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }

  data = {
    "test.conf" = "TEST"
  }
}

resource "kubernetes_deployment" "nginx_deployment" {
  metadata {
    name      = "nginx"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "nginx"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        "app" = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          "app" = "nginx"
        }
      }

      spec {
        container {
          name  = "nginx"
          image = "nginx:latest"

          port {
            container_port = 80
          }

          volume_mount {
            name       = "nginx-vol"
            mount_path = "/tmp/test.conf"
            sub_path   = "test.conf"
          }
        }

        volume {
          name = "nginx-vol"
          config_map {
            name = "nginx-conf"
            items {
              key  = "test.conf"
              path = "test.conf"
              mode = "0644"
            }
          }
        }
      }
    }
  }
}
