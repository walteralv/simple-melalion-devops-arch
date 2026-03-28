# simple-melalion-devops-arch

Starter repository for a DevOps architecture project focused on Infrastructure as Code with Azure and Databricks.

## Overview

This repository now includes a Terraform foundation to define:

- infrastructure and platform architecture
- Azure base resources
- Azure Databricks workspaces
- automation and CI/CD pipelines
- environment configuration and operational documentation

## Terraform Structure

The `terraform/` folder contains a starter setup for:

- `providers.tf`: Terraform version and provider configuration
- `main.tf`: Azure resource group, storage account, Databricks workspace, and an initial Databricks secret scope
- `variables.tf`: input variables
- `outputs.tf`: values exported after apply
- `terraform.tfvars.example`: example values for your environment

## GitHub Actions

This repository includes GitHub Actions workflows in `.github/workflows/`:

- `ci.yml`: runs on pushes, pull requests, and manual trigger
- `deploy.yml`: manual Terraform workflow that can `plan`, `apply`, or `destroy`

The deployment workflow is designed to use a shared Azure Storage backend for Terraform state so GitHub Actions and any local runs can point to the same state file.

## Getting Started

1. Clone the repository.
2. Install Terraform.
3. Copy `terraform/terraform.tfvars.example` to `terraform/terraform.tfvars`.
4. Replace the example values with your Azure naming and subscription details.
5. Create an Azure Storage account and container to store the Terraform state.
6. Configure the GitHub environment secrets and variables used by `.github/workflows/deploy.yml`.
7. Copy `terraform/backend.hcl.example` to `terraform/backend.hcl` and replace the backend values with your Azure Storage backend.
8. Authenticate against Azure if you want to run Terraform locally too.
9. Run `terraform init`, `terraform plan`, and `terraform apply` inside `terraform/`.

## Authentication Notes

For Azure, Terraform commonly uses Azure CLI authentication:

```bash
az login
az account set --subscription "<your-subscription-id>"
```

The Databricks provider is configured from the Azure Databricks workspace created in Terraform.

## Remote State

To avoid losing state between GitHub Actions and local Terraform runs, configure the backend in Azure Storage.

Set these GitHub environment variables:

- `TF_STATE_RESOURCE_GROUP`
- `TF_STATE_STORAGE_ACCOUNT`
- `TF_STATE_CONTAINER`
- `TF_STATE_KEY`

The `deploy.yml` workflow uses those values during `terraform init` so `plan`, `apply`, `destroy`, and future updates all operate on the same remote state.

For local Terraform, use the same backend with a local backend config file:

```bash
cp terraform/backend.hcl.example terraform/backend.hcl
terraform -chdir=terraform init -reconfigure -backend-config=backend.hcl
```

After that, local commands will use the same remote state as GitHub Actions:

```bash
terraform -chdir=terraform plan -var-file="terraform.tfvars"
terraform -chdir=terraform apply -var-file="terraform.tfvars"
terraform -chdir=terraform destroy -var-file="terraform.tfvars"
```

If your local folder still has an old local state file from previous runs, remove it after confirming you no longer need it:

```bash
rm -f terraform/terraform.tfstate terraform/terraform.tfstate.backup
```

## Suggested Sections To Add Later

- Architecture diagram
- Deployment process
- Networking
- Private endpoints
- Unity Catalog
- CI/CD workflow
- Troubleshooting

## License

Add your preferred license here.
