
resource "docker_volume" "shared_storage" {
  name = "shared_volume"
  driver = "local"
  
  driver_opts = {
    device = "C:/git/terraform-docker/storage"
    o = "bind"
    type = "none"
  }
}

#----------------------------------------------------------------
resource "docker_container" "mariadb" {
  name  = "DB-Server"
  image = docker_image.mariadb-10.image_id
  env = [
    "MARIADB_USER=mohamed",
    " MARIADB_PASSWORD=Password",
    "MARIADB_ROOT_PASSWORD=Password"
  ]
  ports {
    internal = 3306
    external = 3306
  }
  mounts {
    source = docker_volume.shared_storage.name
    target = "/var/lib/mysql"
    type = "volume"
  }
}

resource "docker_container" "adminer" {
  name  = "adminer"
  image = docker_image.adminer.image_id
  ports {
    internal = 8080
    external = 8080
  }
}