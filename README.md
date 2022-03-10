# Terraform module for running a dockerized web application
This module was made as a recruitment task. The goal was to run a simple dockerized web app using terraform. As a result, the application should be accessible on [localhost:8081](http://localhost:8081). The docker image of this app is published [here](https://hub.docker.com/r/atlaskaczek/internship_project_w_terraform/tags) on DockerHub.
## Running this module manually

1. Install [Docker](https://docs.docker.com/get-docker/)
1. Install [Terraform](https://www.terraform.io/)
1. Run `docker build -t "<your docker image name here>"` or `make NAME="<your docker image name here>"` if you're using [Make]().
1. Run `cd module/`
1. Run `terraform init`.
1. Run `terraform apply`. During execution you'll be asked to input the name of docker image, that you've set up ealier.
1. When you're done, run `terraform destroy`.