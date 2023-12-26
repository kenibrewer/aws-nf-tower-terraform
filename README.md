# AWS-NF-Tower-Terraform

This repository contains the Terraform code to deploy the SaaS version of Nextflow Tower into a multi-account AWS environment.
This is a work in progress and is not yet ready for production use.

## Features

- Stores Terraform state securely in a KMS encrypted S3 bucket in a terraform management account.
- Creates AWS user, credentials, and access keys work buckets for the Nextflow Tower application to use.
- Creates one or more Tower workspaces within a Tower organization.
- Directly passes the AWS credentials to a Nextflow Tower workspaces without manual copying and pasting.

## Planned Features

- Create a list of AWS Batch compute environments from a json-formatted file for each Tower workspace.
- Add a list of Nextflow pipelines to each Tower workspace from a json-formatted file.
- Add a list of Nextflow Tower users to each Tower workspace from a json-formatted file.

# Setup Instructions

1. Deploy a Terraform Backend using the cloudformation template here:
   https://github.com/thoughtbot/cloudformation-terraform-state-backend

2. Set the following environment variables:

```
export TF_VARS_NFTOWER_API_KEY=<Insert-API-Key-Here>
```

3. Deploy the Terraform code for each environment:

```
cd live/dev
terragrunt run-all init
terragrunt run-all apply
```
