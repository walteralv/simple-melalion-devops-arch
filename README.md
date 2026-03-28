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

This repository includes starter GitHub Actions workflows in `.github/workflows/`:

- `ci.yml`: runs on pushes, pull requests, and manual trigger
- `deploy.yml`: manual deployment placeholder workflow

You can expand these workflows later to add Terraform fmt, validate, plan, and apply stages.

## Getting Started

1. Clone the repository.
2. Install Terraform.
3. Copy `terraform/terraform.tfvars.example` to `terraform/terraform.tfvars`.
4. Replace the example values with your Azure naming and subscription details.
5. Authenticate against Azure.
6. Run `terraform init`, `terraform plan`, and `terraform apply` inside `terraform/`.

## Authentication Notes

For Azure, Terraform commonly uses Azure CLI authentication:

```bash
az login
az account set --subscription "<your-subscription-id>"
```

The Databricks provider is configured from the Azure Databricks workspace created in Terraform.

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
