# Terraform
This is a terraform tutorial for docker and kubenates.

Ref: https://www.terraform.io/docs/ -> provider: to choose infrastructure

----------------
## Docker
```
    terraform apply "docker-config.tfplan"
```
----------------
## Kubenates
```
    terraform apply "k8s-config.tfplan"
```
----------------
## Command
- terraform plan => check *.tf and create plan
- terraform apply "plan" => start terraform deployment
- terraform destroy "plan"
- terrafrom show


**Note:** To specify need to save plan by `terraform plan -target module.name -out name.tfplan`

----------------
## Installation
- download package from https://www.terraform.io/downloads.html
- extract file
- make as binary
- set executable path like $PATH