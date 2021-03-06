# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_pod" "pod_node_affinity" {
  metadata {
    name      = "pod-node-affinity"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"       = "pod-node-affinity"
      "app.kubernetes.io/created-by" = "terraform-awesome"
    }
  }
  spec {
    affinity {
      node_affinity {
        required_during_scheduling_ignored_during_execution {
          node_selector_term {
            match_expressions {
              key      = "kubernetes.io/hostname"
              operator = "In"
              values   = ["kuber1"]
            }
          }
        }

        preferred_during_scheduling_ignored_during_execution {
          weight = 1

          preference {
            match_expressions {
              key      = "kubernetes.io/os"
              operator = "In"
              values   = ["linux"]
            }
          }
        }
      }
    }

    container {
      name  = "pod-node-affinity"
      image = "k8s.gcr.io/pause:2.0"
    }
  }
}
