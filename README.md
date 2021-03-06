# Terraform module for running a dockerized web application
This module was made as a recruitment task. The goal was to run a simple dockerized web app using terraform. As a result, the application should be accessible on [localhost:8081](http://localhost:8081). The docker image of this app is published [here](https://hub.docker.com/r/atlaskaczek/internship_project_w_terraform/tags) on DockerHub.
### Prerequisites
1. Install [Docker](https://docs.docker.com/get-docker/)
1. Install [Terraform](https://www.terraform.io/)
1. Install [Golang](https://golang.org/)

## Running this module manually

1. Run `cd module/`
1. Run `terraform init`.
1. Run `terraform apply -var=docker_img="atlaskaczek/internship_project_w_terraform:v1"`
1. When you're done, run `terraform destroy`.

You can also do all of the above with Make by running:

`make tinit`

`make tapply NAME="atlaskaczek/internship_project_w_terraform:v1"`

Then when you're done run:

`make tdestroy NAME="atlaskaczek/internship_project_w_terraform:v1`.
## Running automated tests against this module

1. Run `cd tests`
1. Run `go test`

Instead of last two points you can run `make ttest`.