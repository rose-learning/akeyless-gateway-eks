# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "access_key" {
  description = "aws access key"
}

variable "secret_key" {
  description = "aws access secret key"
}

variable "cluster_name" {
  description = "eks cluster name"
  default = "rose-gateway-eks"
}

variable "vpc_name" {
 default = "cs-rose-eks-demo-vpc"
}

variable "node_group_name" {
  default = "eks-node-group-rose"
}

variable "resource_owner" {
  default = "rosez"
}
