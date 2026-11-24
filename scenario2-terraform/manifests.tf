
locals {
  serviceaccounts = {
    for f in fileset("${path.module}/manifests", "serviceaccount-*.yaml") :
    trimsuffix(f, ".yaml") => yamldecode(file("${path.module}/manifests/${f}"))
  }

  services = {
    for f in fileset("${path.module}/manifests", "service-*.yaml") :
    trimsuffix(f, ".yaml") => yamldecode(file("${path.module}/manifests/${f}"))
  }

  deployments = {
    for f in fileset("${path.module}/manifests", "deployment-*.yaml") :
    trimsuffix(f, ".yaml") => yamldecode(file("${path.module}/manifests/${f}"))
  }
}

resource "kubernetes_manifest" "serviceaccounts" {
  for_each = local.serviceaccounts
  manifest = each.value
}

resource "kubernetes_manifest" "services" {
  for_each = local.services
  manifest = each.value

  depends_on = [
    kubernetes_manifest.serviceaccounts
  ]
}

resource "kubernetes_manifest" "deployments" {
  for_each = local.deployments
  manifest = each.value

  depends_on = [
    kubernetes_manifest.serviceaccounts,
    kubernetes_manifest.services
  ]

  wait {
    rollout = true
  }
}
