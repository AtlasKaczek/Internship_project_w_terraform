terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "simple_website" {
  name         = var.docker_img
  keep_locally = true
}

resource "docker_container" "simple_website_container" {
  image = docker_image.simple_website.latest
  name  = "website"
  ports {
    internal = var.port[0].internal
    external = var.port[0].external
  }
}