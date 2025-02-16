# homelab-k8s

Cluster config for the home lab. One NUC (control plane + storage) and a few
Raspberry Pis.
Everything under `clusters/home` is reconciled by Flux; commit and push to
change the cluster.
## Nodes

Talos Linux. Machine config patches are in `talos/`.
Bootstrap:

    talosctl gen config home https://192.168.1.10:6443 --config-patch @talos/patch.yaml
    talosctl apply-config --insecure -n 192.168.1.10 -f controlplane.yaml
    flux bootstrap github --owner=qerope --repository=homelab-k8s --path=clusters/home
