# https://github.com/ssbostan/terraform-awesome


resource "github_repository_webhook" "github-repository-add-webhook" {
  repository = var.github_repository

  configuration {
    url          = "https://google.de/"
    content_type = "form"
    insecure_ssl = false
  }

  active = false

  events = ["issues"]
}
