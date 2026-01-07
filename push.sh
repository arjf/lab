#!/bin/bash
targets=("lab-datastore" "lab-dev" "lab-dev-2")

for target in "${targets[@]}"; do
  echo "pushing to $target"
  rsync -avzP -e "ssh -F ./ssh_config" $PWD root@$target:~/
  echo "push to $target done"
done
