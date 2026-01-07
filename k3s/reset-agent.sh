#!/bin/bash
source ./k3s.env
curl -sfL https://get.k3s.io | sh -s - agent \
  --server https://${CONTROL_IP}:6443 \
  --token ${K3S_TOKEN} \
  --node-name="lab-dev-k3s-2" \
  --kubelet-arg=--eviction-hard=memory.available\<256Mi \
  --kubelet-arg=--eviction-soft=memory.available\<512Mi \
  --kubelet-arg=--eviction-soft-grace-period=memory.available=1m30s \
  --kubelet-arg=--kube-reserved=memory=512Mi \
  --kubelet-arg=--system-reserved=memory=256Mi \
