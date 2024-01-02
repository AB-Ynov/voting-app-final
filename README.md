```markdown
# Projet Voting App

Ce projet est une application de vote simple déployée sur Kubernetes, avec des métriques surveillées par Prometheus et une visualisation des données via Grafana. L'intégration d'alertes Slack permet également d'être informé des événements critiques.

## Infrastructure

L'infrastructure du projet a été mise en place à l'aide de Terraform et comprend un cluster Kubernetes (AKS), un réseau virtuel, et d'autres ressources nécessaires.

```plaintext
Terraform/
|-- outputs.tf
|-- providers.tf
|-- terraform.tf
|-- variables.tf
```

## Déploiement Kubernetes

Le déploiement des applications sur Kubernetes est géré par des fichiers de configuration YAML.

```plaintext
Kubernetes/
|-- voting-app-deployment.yaml
|-- redis-deployment.yaml
|-- prometheus/
|   |-- prometheus-deployment.yaml
|   |-- prometheus-config-map.yaml
|-- grafana/
    |-- grafana-deployment.yaml
    |-- grafana-datasource-config.yaml
```

## Helm Charts

Helm est utilisé pour simplifier le déploiement et la gestion des applications sur Kubernetes.

```plaintext
Helm/
|-- prometheus/
|   |-- values.yaml
|-- grafana/
    |-- values.yaml
```

## Instructions d'Installation

1. **Déploiement de l'Infrastructure :** Exécutez les scripts Terraform pour créer l'infrastructure Azure nécessaire.

2. **Déploiement Kubernetes :** Appliquez les fichiers de configuration Kubernetes pour déployer les applications.

    ```bash
    kubectl apply -f Kubernetes/
    ```

3. **Helm Charts :** Utilisez Helm pour installer Prometheus et Grafana avec les configurations spécifiées.

    ```bash
    helm install prometheus ./Helm/prometheus -n monitoring
    helm install grafana ./Helm/grafana -n monitoring
    ```

4. **Configurer Grafana :** Ajoutez la Datasource Prometheus à Grafana et configurez un Dashboard pour surveiller l'utilisation CPU et mémoire de la Voting App et Redis.

5. **Alertes :** Configurez les alertes dans Grafana pour avertir en cas de dépassement des seuils de mémoire (50% et 75%). Intégrez Grafana avec Slack pour recevoir les alertes.

    - Créez un Workspace Slack.
    - Configurez Grafana pour utiliser Slack comme canal d'alerte.

---

**Note :** Assurez-vous d'avoir les outils nécessaires tels que `kubectl`, `helm`, et Terraform installés localement. Consultez la documentation respective pour plus d'informations.

Pour toute question ou problème, n'hésitez pas à contacter les contributeurs du projet.
```