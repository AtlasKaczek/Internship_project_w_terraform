output "container_id" {
    description = "ID of the Docker container"
    value       = docker_container.simple_website_container.id
}

output "image_id" {
    description = "ID of the Docker image"
    value       = docker_image.simple_website.id
}

output "ip_adress" {
    description = "IP adress of the website"
    value = join(":",["http://localhost", var.port[0].external])
}