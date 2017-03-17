# Using Helm

Make sure you deploy where your expecting, for local deployments run:

```bash
kubectl config use-context minikube
```

Install a chart from a local directory:

```bash
helm install .
```

Upgrade a chart from a local directory:

```bash
helm upgrade <release-name> .
```

Release name can be found with:

```bash
helm list
```

## Globals

Multiple charts in the repo respect the following global config options (and the corresponding default value):

```yaml
global:
  
  # enable oauth2 authentication where appropriate
  auth: false
  
  # enable TLS/HTTPS & certificates
  tls: false

  domains:
    # domain for the website & APIs
    website: localdev.retracehealth.com

    # domain for things like kibana and grafana
    monitoring: monitoring-local.retracehealth.com
```
