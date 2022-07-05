# https://github.com/ssbostan/terraform-awesome


resource "github_organization_webhook" "add-organization-webhook" {

  configuration {
    url          = "https://google.de/"
    content_type = "form"
    insecure_ssl = false
  }

  active = false

  events = ["issues"]
}
