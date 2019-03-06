provider "kubernetes" {
  host = "https://192.168.99.100:8443"
}

resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "nginx-deployment"

    labels {
      app = "nginx"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels {
        app = "nginx"
      }
    }

    template {
      metadata {
        labels {
          app = "nginx"
        }
      }

      spec {
        container {
          image = "nginx:1.11-alpine"
          name  = "nginx-server"

          resources {
            limits {
              cpu    = "0.5"
              memory = "512Mi"
            }
          }
        }
      }
    }
  }
}

