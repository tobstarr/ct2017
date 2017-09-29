#!/bin/bash
set -e -o pipefail

if [[ $(which kubeadm) ]]; then
  kubeadm reset --skip-preflight-checks
fi
systemctl stop docker kubelet || /bin/true
yum remove -y docker kubelet kubeadm kubectl
rm -Rf /data/k8s
