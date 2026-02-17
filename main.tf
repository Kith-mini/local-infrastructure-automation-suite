terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# -------------------------
# Docker Network
# -------------------------
resource "docker_network" "devops_net" {
  name = "local_devops_network"
}

# -------------------------
# Nginx Web Server
# -------------------------
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "my_local_server"

  networks_advanced {
    name = docker_network.devops_net.name
  }

  ports {
    internal = 80
    external = 8000
  }
}

# -------------------------
# Python Monitoring Dashboard
# -------------------------
resource "docker_image" "monitor" {
  name = "local-monitor:1"

  build {
    context    = "${path.module}/monitor"
    dockerfile = "Dockerfile"
  }
}

resource "docker_container" "monitor" {
  name  = "monitor_dashboard"
  image = docker_image.monitor.image_id

  networks_advanced {
    name = docker_network.devops_net.name
  }

  ports {
    internal = 5000
    external = 5000
  }
}
