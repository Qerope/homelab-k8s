#!/bin/sh
# usage: k3s.sh server | k3s.sh agent SERVER_IP TOKEN
set -e
case "$1" in
  server)
    curl -sfL https://get.k3s.io | sh -
    ;;
  agent)
    curl -sfL https://get.k3s.io | K3S_URL="https://$2:6443" K3S_TOKEN="$3" sh -
    ;;
esac
