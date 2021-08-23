variable "environment" {
    default = "create"
}

resource "random_pet" "host" {}

output "host" {
  value = "${random_pet.host.id}-${lower(var.environment)}"
}