# Kubernetes - DigitalOcean - Terraform

Deploy your Kubernetes cluster on DigitalOcean using Terraform.

Test your CKA(D) skills

Version deployed of kubernetes 1.20.1-00

## Requirements

* [DigitalOcean](https://www.digitalocean.com/) account
* DigitalOcean Token [In DO's settings/tokens/new](https://cloud.digitalocean.com/settings/tokens/new)
* [Terraform](https://www.terraform.io/)


## Generate private / public keys

```
ssh-keygen -t rsa -b 4096
```

The system will prompt you for a file path to save the key, we will go with `~/.ssh/id_rsa` in this tutorial.

## Add your public key in the DigitalOcean control panel

[Do it here](https://cloud.digitalocean.com/settings/security). Name it and paste the public key just below `Add SSH Key`.


## Invoke Terraform


```bash
export TF_VAR_do_token={YOUR DO TOKEN}
export TF_VAR_ssh_fingerprint=(YOUT DO FINGERPRINT)
export TF_VAR_pvt_key=/root/.ssh/id_rsa  or your path
```

After setup, call `terraform`

```bash
terraform init
terraform plan
terraform apply
```

That should do! 

```bash
$ KUBECONFIG=$PWD/secrets/admin.conf kubectl get no
NAME          LABELS                               STATUS
X.X.X.X   kubernetes.io/hostname=X.X.X.X   Ready     2m
Y.Y.Y.Y   kubernetes.io/hostname=Y.Y.Y.Y   Ready     2m

$ KUBECONFIG=$PWD/secrets/admin.conf kubectl --namespace=kube-system get po
NAME                                   READY     STATUS    RESTARTS   AGE
kube-apiserver-X.X.X.X                    1/1       Running   0          13m
kube-controller-manager-X.X.X.X           1/1       Running   0          12m
kube-proxy-X.X.X.X                        1/1       Running   0          12m
kube-proxy-X.X.X.X                        1/1       Running   0          11m
kube-proxy-X.X.X.X                        1/1       Running   0          12m
kube-scheduler-X.X.X.X                    1/1       Running   0          13m
```

You are good to go. Now, we can keep on reading to dive into the specifics.

### Setup `kubectl`

After the installation is complete, `terraform` will put the kubeconfig in `secrets/admin.conf`. Test your brand new cluster

```bash
KUBECONF=$PWD/secrets/admin.conf kubectl get nodes
```

You should get something similar to

```
$ kubectl get nodes
NAME          LABELS                               STATUS
X.X.X.X       kubernetes.io/hostname=X.X.X.X       Ready
```

### Deploy microbot with External IP

The file `04-microbot.yaml` will be rendered (i.e. replace the value `EXT_IP1`), and then `kubectl` will create the Service and Replication Controller.

To see the IP of the service, run `kubectl get svc` and look for the `EXTERNAL-IP` (should be the first worker's ext-ip).
