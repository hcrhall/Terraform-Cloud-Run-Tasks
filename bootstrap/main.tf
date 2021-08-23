variable "destroy" { default = false }
variable "org" { default = "" }
variable "token" { default = "" }

locals {
  tasks = {
    pass = {
      name = "run-task-pass"
      url  = "http://floating-caverns-48130.herokuapp.com/api/run-tasks/pass"
    }
    fail = {
      name = "run-task-fail"
      url  = "http://floating-caverns-48130.herokuapp.com/api/run-tasks/pass"
    }
    timeout = {
      name = "run-task-timeout"
      url  = "http://floating-caverns-48130.herokuapp.com/api/run-tasks/timeout"
    }
    404 = {
      name = "run-task-404"
      url  = "http://floating-caverns-48130.herokuapp.com/api/run-tasks/error-404"
    }
    500 = {
      name = "run-task-500"
      url  = "http://floating-caverns-48130.herokuapp.com/api/run-tasks/error-500"
    }
    503 = {
      name = "run-task-503"
      url  = "http://floating-caverns-48130.herokuapp.com/api/run-tasks/error-503"
    }
    surprise = {
      name = "run-task-surprise"
      url  = "http://floating-caverns-48130.herokuapp.com/api/run-tasks/kinder-surprise"
    }
  }
}

resource "null_resource" "Run-Task" {
  for_each = local.tasks
  triggers = {
    time = timestamp()
  }
  provisioner "local-exec" {
    command     = templatefile("${path.module}/bootstrap.tpl", { ORG = var.org, TOKEN = var.token, NAME = each.value.name, URL = each.value.url })
    interpreter = ["/bin/bash", "-c"]
  }
}
