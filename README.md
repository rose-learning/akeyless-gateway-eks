# Deploy an Akeyless Gateway on EKS

This repo is a companion repo to the [Provision an EKS Cluster tutorial](https://developer.hashicorp.com/terraform/tutorials/kubernetes/eks), containing
Terraform configuration files to provision an EKS cluster on AWS.

## 1. Prerequisites
- Have terraform cli installed locally. Follow this [guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) to install terraform if needed
```
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

```

- Update the access_key and secret_key in the terraform.tfvars.example and remove .example from the file extension

- Update the locals block in the main.tf file to reflect the names you would like to use
```
locals {
  cluster_name = "rose-gateway-eks"
  vpc_name = "cs-rose-eks-demo-vpc"
  node_group_name = "eks-node-group-rose"
}

```
- Update the terraform.tf file to specify where the state file will be stored. Remove the cloud block if the state file is stored on the local machine
```
  terraform {
  cloud {
    organization = "dcatcher-learning"

    workspaces {
      name = "akeyless-eks-demo"
    }
  }
```

## 2. Set up Akeyless Gateway with Nginx Ingress and Cert Manager on the EKS cluster
- Run the following cli locally to get the EKS cluster access credentials
```
aws eks --region $(terraform output -raw region) update-kubeconfig \
    --name $(terraform output -raw cluster_name)

```

- Once the EKS is up and running, follow this [guide](https://gist.github.com/devorbitus/a292aa1bed559c9b87053aa0fe21d094) to set up Akeyless Gateway with Nginx Ingress and Cert Manager
```
https://gist.github.com/devorbitus/a292aa1bed559c9b87053aa0fe21d094
```

- Add CNAME record to the hosted zone in AWS Route 53 with a CNAME record pointing to the Nginx Ingress External IP/DNS Name

