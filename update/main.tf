variable "environment" {
    default = "update"
}

resource "random_pet" "host" {
    keepers = {
    timestamp = "${timestamp()}"
  }
}

output "host" {
  value = "${random_pet.host.id}-${lower(var.environment)}"
}