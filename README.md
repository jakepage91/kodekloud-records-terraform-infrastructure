# Terraform Infrastructure Automation

## Overview
This Terraform project automates the provisioning of:
- IAM users dynamically from `terraform.tfvars`
- A simple EC2 instance for standalone workloads
- An EKS cluster for Kubernetes workloads

## Requirements
- Terraform v1.3+
- AWS CLI configured
- A valid AWS access key

## Setup

1. **Initialize Terraform**
   ```bash
   terraform init

2. **Plan Deployment**
   ```bash
   terraform plan

3. **Apply Changes**
   ```bash
   terraform apply -auto-approve

4. **Destroy Resources (if needed)**
   ```bash
   terraform destroy -auto-approve
   ```

