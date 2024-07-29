# Kubernetes Deployment Manifest
resource "kubernetes_deployment_v1" "flaskapp" {
  metadata {
    name = "flaskapp-deployment"
    labels = {
      app = "flaskapp"
    }
  } 
 
  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "flaskapp"
      }
    }

    template {
      metadata {
        labels = {
          app = "flaskapp"
        }
      }

      spec {
        container {
          image = "546541384184.dkr.ecr.us-east-1.amazonaws.com/sample-flask-app:latest"
          name  = "flaskapp-container"
          port {
            container_port = 8000
          }
          }
        }
      }
    }
}

#Kuberetes LB Service 
resource "kubernetes_service_v1" "lb_service" {
  metadata {
    name = "flaskapp-lb-service"
  }
  spec {
    selector = {
      app = kubernetes_deployment_v1.flaskapp.spec.0.selector.0.match_labels.app
    }
    port {
      name        = "http"
      port        = 80
      target_port = 8000
    }
    type = "LoadBalancer"
  }
}