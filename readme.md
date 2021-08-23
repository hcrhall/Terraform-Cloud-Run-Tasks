# Terraform Run Tasks Testing Configuration

This repository contains configuration that can be used within Terraform Cloud to test and validate Terraform Run Tasks. The configuration uses the [random_pet](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) resource to trigger a given action on the resource object.

Valid actions values for this config are:
* ["no-op"]
* ["create"]
* ["delete", "create"]

## Usage/Action

You can use this configuration by:

1. Clone/Fork the repository
2. [Configure a new workspace](https://www.terraform.io/docs/cloud/workspaces/creating.html#configuring-a-new-workspace):
    * Connect to the correct Version Control Provider
    * Choose the source repository
    * Set the `Terraform Working Directory`

> **Note:**

> Configuration of the Terraform working directory _should_ be the only advanced option that needs to define. There are currently two options available:
* **create** - Resulting in a `["create"]` action on the first run, and `["no-op"]` on subsequent runs.
* **update** - Resulting in a `["create"]` action on the first run, and `["delete", "create"]` on subsequent runs.