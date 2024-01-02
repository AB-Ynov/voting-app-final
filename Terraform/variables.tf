variable "prometheus_version" {
  description = "Prometheus version to install"
  default     = "2.30.3"
}

variable "grafana_version" {
  description = "Grafana version to install"
  default     = "8.2.0"
}

variable "slack_webhook_url" {
  description = "Slack Webhook URL for Grafana alerts"
}

variable "grafana_admin_password" {
  description = "Password for Grafana admin user"
}
