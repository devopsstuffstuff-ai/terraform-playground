terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}




# Basic usage 

resource "github_repository" "test" {
  name        = "myterraform"
  description = "My awesome codebase"
  auto_init   = true
}

resource "github_branch" "mybranch" {
  repository = github_repository.test.name
  branch     = "development"
}

resource "github_branch_default" "default" {
  repository = github_repository.test.name
  branch     = github_branch.mybranch.branch
}
