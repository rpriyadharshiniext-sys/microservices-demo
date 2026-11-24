# Scenario 2 – Online Boutique using Terraform

This folder contains the Terraform configuration and Kubernetes manifests used to deploy the Online Boutique microservices application on an existing AWS EC2 instance running K3s.

## Technologies
- Terraform
- AWS EC2
- Kubernetes (K3s)
- Docker
- GitHub Container Registry (GHCR)

## Deployment
Terraform manages the Kubernetes Deployments, Services and ServiceAccounts in the `online-boutique-scenario2` namespace.

The application was verified with all 11 pods running and the frontend responding successfully.

**Note:** This is an AWS-based adaptation of the original GKE deployment assignment.
