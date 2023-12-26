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
- Adopt gitops terraform worklfow instead of CLI-driven workflow.

# Setup Instructions

## AWS Account Setup

1. Use a best-practices AWS account structure such as [biotech-blueprint-multi-account](https://github.com/aws-samples/biotech-blueprint-multi-account) with AWS Control Tower enabled.

2. Create separate dedicated accounts for each nf-tower environment (dev, prod, etc.) and have a terraform management account.

3. Deploy a Terraform Backend to the management account using this [cloudformation template](https://github.com/thoughtbot/cloudformation-terraform-state-backend).

## Dev Environment Setup

1. Fork and clone this repository.

2. When opening the repository in VS Code, select "Open Repository in Container" to use the included development environment.

3. Use `aws configure sso` to setup AWS cli profiles for the management account and each Seqera Platform environment account.

## Seqera Platform Setup

1. Create a [Seqera Platform](https://tower.nf/) account.

2. Create one organization in Seqera Platform for each environment (dev, prod, etc.).

3. Create an authorization [token](https://docs.seqera.io/platform/23.3.0/api/overview#authentication) for your Seqera Platform account.

4. Set the following environment variable in your dev environment (e.g. using [Codespaces secrets](https://docs.github.com/en/codespaces/managing-your-codespaces/managing-your-account-specific-secrets-for-github-codespaces)):

```
export TF_VARS_NFTOWER_API_KEY=<Insert-API-Key-Here>
```

## Terraform Setup

1. Review the subdirectories of the `live` directory and adjust the variables in the files:

- `aws_account.hcl`
- `env.hcl`
- `nftower.hcl`

2. Deploy the Terraform code for each environment:

```
cd live/dev
terragrunt run-all init
terragrunt run-all plan
terragrunt run-all apply
```

# Additional Documentation

- [Terraform](https://developer.hashicorp.com/terraform/docs)
- [Terragrunt](https://terragrunt.gruntwork.io/)
- [Nextflow Tower](https://help.tower.nf/)
