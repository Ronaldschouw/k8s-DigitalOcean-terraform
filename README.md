# Kubernetes - DigitalOcean - Terraform

Deploy your Kubernetes cluster on DigitalOcean using Terraform.

Test your CKA(D) skills. It is not recommended to use this cluster in production.
Just play arround and destroy the droplets when your done.

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
export TF_VAR_ssh_fingerprint=(YOUR DO FINGERPRINT)
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
Your ansible inventory file is supplied automatically by terraform.

ansible-playbook main.yaml
```

You are good to go. Now, install the extra stuff to make life easy.

## Extra Tooling `kubens kubectx fzf bashcompletion and aliases`
```bash
ansible-playbook tool.yaml
```
Add your own alaises to and the tools.yaml
To make it easy for you, a number of them have already been added
```bash
alias k='kubectl'
alias kg='kubectl get'
alias kp='kubectl get pods'
alias kn='kubectl get nodes'
alias klo='kubectl logs -f'
alias kge='kubectl get events --sort-by='.metadata.creationTimestamp''
```

### good luck with the exam !



