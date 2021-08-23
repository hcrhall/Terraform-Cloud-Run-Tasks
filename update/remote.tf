# Using a single workspace:
terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "rhall"

    workspaces {
      name = "Terraform-Cloud-Run-Tasks-Update"
    }
  }
}