variable "docker_img" {
    description = "Value of the name for the Docker image"
    type = string
}

variable "port" {
    description = "Values of the external and internal ports"
    type = list(object({
        internal = number
        external = number
    }))
    default = [ {
        internal = 80
        external = 8081
    } ]
}