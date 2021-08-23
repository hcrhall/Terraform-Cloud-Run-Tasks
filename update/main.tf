variable "meta" {
    default = "bar"
}

resource "random_pet" "name" {
    keepers = {
    timestamp = "${timestamp()}"
  }
}

output "host" {
  value = "${random_pet.name.id}-${lower(var.meta)}"
}