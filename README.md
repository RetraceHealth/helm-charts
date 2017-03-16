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
