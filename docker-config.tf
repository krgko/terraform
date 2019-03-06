provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "nginx" {
  name = "nginx:1.11-alpine"
}

resource "docker_container" "nginx-server" {
  name = "nginx-server"
  image = "${docker_image.nginx.latest}"
  env = ["TEST=test", "TEST1=test1"]
  ports {
    internal = 80
    external = 8099
  }
  volumes {
    container_path  = "/usr/share/nginx/html"
    host_path = "/home/origincert/Desktop/tutorial+testing/terraform/www"
    read_only = true
  }
  healthcheck {
    test = ["CMD", "curl", "-f", "http://0.0.0.0/health"]
    interval = "2s"
    timeout = "5s"
    retries = 3
  }
}