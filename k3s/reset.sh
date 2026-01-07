#!/bin/bash
source ./k3s.env
curl -sfL https://get.k3s.io | sh -s - server \
  --datastore-endpoint="postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${DATASTORE_IP}:5432/${POSTGRES_DB}?sslmode=disable" \
  --node-name="lab-dev-k3s-1" \
  --token ${K3S_TOKEN} \
  --write-kubeconfig-mode=644 \
  --disable=traefik \
  --kube-controller-manager-arg=--concurrent-deployment-syncs=2 \
  --kube-controller-manager-arg=--concurrent-endpoint-syncs=2 \
  --kube-controller-manager-arg=--concurrent-service-syncs=2 \
  --kube-controller-manager-arg=--concurrent-gc-syncs=5 \
  --kube-apiserver-arg=--max-requests-inflight=200 \
  --kube-apiserver-arg=--max-mutating-requests-inflight=100 \
  --kubelet-arg=--eviction-hard=memory.available\<256Mi \
  --kubelet-arg=--eviction-soft=memory.available\<512Mi \
  --kubelet-arg=--eviction-soft-grace-period=memory.available=1m30s \
  --kubelet-arg=--kube-reserved=memory=512Mi \
  --kubelet-arg=--system-reserved=memory=256Mi \
  --flannel-backend=host-gw \
  --tls-san=${CONTROL_IP}
