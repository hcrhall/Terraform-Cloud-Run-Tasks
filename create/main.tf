variable "meta" {
    default = "foo"
}

resource "random_pet" "name" {}

output "host" {
  value = "${random_pet.name.id}-${lower(var.meta)}"
}