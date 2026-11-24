terraform {
  required_version = ">= 1.5.0"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 3.5"
    }
  }
}

provider "kubernetes" {
  config_path = "/home/ubuntu/.kube/config"
}
