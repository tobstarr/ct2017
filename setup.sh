#!/bin/bash
set -e -o pipefail

# write configuration files
sudo tee /etc/yum.repos.d/kubernetes.repo <<EOF
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
        https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

sudo tee /etc/sysconfig/docker-storage <<EOF
DOCKER_STORAGE_OPTIONS="--storage-driver=overlay2"
EOF

sudo tee /etc/sysconfig/docker <<"EOF"
OPTIONS='--selinux-enabled --signature-verification=false'
if [ -z "${DOCKER_CERT_PATH}" ]; then
    DOCKER_CERT_PATH=/etc/docker
fi
EOF

# install and enable
sudo yum install -y docker kubelet-1.7.5 kubeadm-1.7.5 kubectl-1.7.5
sudo systemctl enable --now kubelet docker

# setup cluster
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --skip-preflight-checks
# sudo kubeadm init --config=./config --skip-preflight-checks

# setup kubectl
mkdir -p $HOME/.kube
sudo cat /etc/kubernetes/admin.conf > $HOME/.kube/config

# finish cluster
kubectl taint nodes --all node-role.kubernetes.io/master-
kubectl create -f ./k8s/flannel.yml
