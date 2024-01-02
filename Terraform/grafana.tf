resource "helm_release" "grafana" {
  name             = "grafana"
  namespace        = "monitoring"
  create_namespace = true
  repository       = "grafana/grafana"
  chart            = "grafana"
  version          = var.grafana_version

  set {
    name  = "adminPassword"
    value = var.grafana_admin_password
  }

  set {
    name  = "datasources.datasources.yaml.apiVersion"
    value = 1
  }

  set {
    name  = "datasources.datasources.yaml.datasources"
    value = jsonencode([
      {
        name       = "Prometheus"
        type       = "prometheus"
        url        = "http://prometheus-server.monitoring.svc.cluster.local"
        access     = "proxy"
        isDefault  = true
        jsonData   = "{ \"httpMethod\": \"GET\" }"
        editable   = true
      }
    ])
  }

  set {
    name  = "alerting.slackEnabled"
    value = true
  }

  set {
    name  = "alerting.slackAPIUrl"
    value = var.slack_webhook_url
  }

  depends_on = [
    azurerm_kubernetes_cluster.aks,
    local_file.kube_config,
    helm_release.prometheus
  ]
}
