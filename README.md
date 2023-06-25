# monitoring-external-etcd-in-prometheus-stack
**monitoring external etcd in prometheus stack**

**Requirments:**
|kube prometheus stack | https://artifacthub.io/packages/helm/prometheus-community/kube-prometheus-stack version 46.8.0
|------|--------|
kubernetes| version 1.25.5
etcd | version 3.5.6
helm | version 3.10.3
longhorn block storage | version 1.4.2
nexus oss (as private registry)| version 3.48.0-01 or newer

```
*Steps:*
0- helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

1- create mobitoring namespace:
kubectl create namespace

2- create secret for access to etcd metrics

Example:

kubectl -n monitoring create secret generic etcd-client-cert \
--from-file=ca.pem=/etc/ssl/etcd/ssl/ca.pem \
--from-file=etcd-cert.pem=/etc/ssl/etcd/ssl/member-k8s-master01.pem \
--from-file=etcd-key.pem=/etc/ssl/etcd/ssl/member-k8s-master01-key.pem

3- download chart for offline deploy :
helm pull prometheus-community/kube-prometheus-stack
Note: after pulling you must see a *.tgz file.

4- deploy kube-prometheus-stack helm chart with customized values.
helm install prometheus-stack kube-prometheus-stack-46.8.0.tgz --version 46.8.0 -n monitoring -f helm.yaml

5- after deploy check pods and services status.
```
![image](https://github.com/IMAN-NAMJOOYAN/monitoring-external-etcd-in-prometheus-stack/assets/16554389/d9e132b4-39c7-4fa5-bdd2-3a6d73bbedea)

![image](https://github.com/IMAN-NAMJOOYAN/monitoring-external-etcd-in-prometheus-stack/assets/16554389/94753bfb-3f37-48f8-a014-df6dc2433dc9)

```
6- check etcd dashboard in grafana.
```
![image](https://github.com/IMAN-NAMJOOYAN/monitoring-external-etcd-in-prometheus-stack/assets/16554389/9627d5d2-0bb0-4f7b-ac9e-2baa5f83c4ab)
```














