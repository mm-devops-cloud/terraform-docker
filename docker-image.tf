data "docker_registry_image" "nginx-latest" {
  name = "nginx:latest"
}

resource "docker_image" "nginx-latest" {
  name          = data.docker_registry_image.nginx-latest.name
  pull_triggers = [data.docker_registry_image.nginx-latest.sha256_digest]
}


resource "docker_image" "mariadb-10" {
  name = "mariadb:10.7.8"
}

resource "docker_image" "adminer" {
  name = "adminer"
}