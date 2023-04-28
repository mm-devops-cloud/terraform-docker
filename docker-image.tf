data "docker_registry_image" "nginx-latest" {
  name = "nginx:latest"
}

resource "docker_image" "nginx-latest" {
  name          = data.docker_registry_image.nginx-latest.name
  pull_triggers = [data.docker_registry_image.nginx-latest.sha256_digest]
}


resource "docker_image" "nginx-stable" {
  name = "nginx:stable"
}