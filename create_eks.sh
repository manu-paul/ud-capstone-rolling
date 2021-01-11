#!/usr/bin/env bash

# Step 1:
# Create AWS EKS with name capstone
eksctl create cluster --name capstone --version 1.17 --nodegroup-name standard-workers --node-type t2.micro --nodes 3 --nodes-min 1 --nodes-max 4 --node-ami auto --region us-west-2

# Step 2:
# Update kubeconfig and display the kubectl context
aws eks --region us-west-2 update-kubeconfig --name capstone