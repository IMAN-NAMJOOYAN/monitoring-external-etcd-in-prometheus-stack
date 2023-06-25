#!/bin/bash

kubectl -n monitoring create secret generic etcd-client-cert \
--from-file=ca.pem=/etc/ssl/etcd/ssl/ca.pem \
--from-file=etcd-cert.pem=/etc/ssl/etcd/ssl/member-k8s-master01.pem \
--from-file=etcd-key.pem=/etc/ssl/etcd/ssl/member-k8s-master01-key.pem


#helm install prometheus-stack prometheus-community/kube-prometheus-stack --version 46.8.0 -n monitoring -f helm.yaml
helm install prometheus-stack kube-prometheus-stack-46.8.0.tgz --version 46.8.0 -n monitoring -f helm.yaml
