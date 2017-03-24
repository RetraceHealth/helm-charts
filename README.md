# Helm Charts

## Installing Helm

You can install helm with homebrew.

```bash
brew install kubernetes-helm
```

## Using Helm

Make sure you deploy where your expecting, for local deployments run:

```bash
kubectl config use-context minikube
```

Install helm into the cluster:

```bash
helm init
```

Install mysql (prod version):

```bash
helm install stable/mysql --set imageTag=5.7.11
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

## Deploying the Platform Chart

1. Get the values file from gopass
  - `gopass rt/k8s/dev/values.yaml >platform-dev-values.yaml`
2. Install the platform chart
  1. `cd platform` -- Move to the platform directory
  2. `helm install . -n platform -f ../platform-dev-values.yaml --namespace=dev`
3. Upgrade as needed
  - `helm upgrade platform . -f ../platform-dev-values.yaml --namespace=dev`


## Deploying the Monitoring Chart

1. Install the monitoring chart **Note: add `--set global.tls=false` for step 1.2 and 2, if you are installing to minikube**
  1. `cd monitoring` -- Move to the monitoring directory
  2. `helm install . -n monitoring -f ../platform-dev-values.yaml --namespace monitoring` -- Install the chart, configured for the specified domain
2. Upgrade as needed
  - `helm upgrade monitoring . -f ../platform-dev-values.yaml --namespace monitoring`

## Deploying the Ingress Chart

1. Install the ingress chart **Note: add `--set global.tls=false` for step 1.2 and 2, if you are installing to minikube**
  1. `cd ingress` -- Move to the ingress directory
  2. `helm install . -n ingress -f ../platform-dev-values.yaml --namespace kube-system`
2. Upgrade as needed
  - `helm upgrade ingress . -n ingress -f ../platform-dev-values.yaml --namespace kube-system`
