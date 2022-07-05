# https://github.com/ssbostan/terraform-awesome

# Create a new, red colored label for repo "test_repo"
resource "github_issue_label" "test_repo" {
  repository = "test-repo"
  name       = "Urgent"
  color      = "FF0000"
}