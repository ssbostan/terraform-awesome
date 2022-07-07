# https://github.com/ssbostan/terraform-awesome

resource "kubernetes_cron_job_v1" "job_echo" {
  metadata {
    name = "job_echo"
  }

  spec {
    concurrency_policy            = "Replace"
    failed_jobs_history_limit     = 5
    schedule                      = "0 14 * * *"
    starting_deadline_seconds     = 10
    successful_jobs_history_limit = 10
    job_template {
      metadata {}
      spec {
        backoff_limit              = 2
        ttl_seconds_after_finished = 10
        template {
          metadata {}
          spec {
            container {
              name    = "echo"
              image   = "busybox"
              command = ["/bin/sh", "-c", "date; echo Hello from the Kubernetes cluster managed by Terraform"]
            }
          }
        }
      }
    }
  }
}
