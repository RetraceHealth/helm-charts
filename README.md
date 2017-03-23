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

## Deploying the Platform Environment

1. Install MySQL (if RDS is being used, skip this step)
  1. `helm install stable/mysql --set imageTag=5.7.11` -- creates mysql in the default namespace, under **NOTES:** take note of the dns name (e.g. something like telling-aardvark-mysql.default.svc.cluster.local)
  2.  `kubectl get secret --namespace default telling-aardvark-mysql -o jsonpath="{.data.mysql-root-password}" | base64 --decode; echo` -- get the generated root password
2. Get the values file from gopass
  - `gopass rt/k8s/dev/values.yaml >platform-dev-values.yaml`
3. Install the platform chart
  1. `cd platform` -- Move to the platform directory
  2. `helm install . -f ../platform-dev-values.yaml --namespace=dev --set global.db.host=<db-host-from-notes-or-rds> --set global.db.pass=<db-pass> --set global.db.user=<db-user>` -- Install platform to **dev** with the DB set appropriately. You can see it again with `helm status <release name>`
