resource "helm_release" "prometheus" {
  name             = "prometheus"
  namespace        = "monitoring"
  create_namespace = true
  repository       = "prometheus-community"
  chart            = "prometheus"
  version          = var.prometheus_version

  set {
    name  = "server.persistentVolume.size"
    value = "5Gi"
  }

  depends_on = [
    azurerm_kubernetes_cluster.aks,
    local_file.kube_config
  ]
}
