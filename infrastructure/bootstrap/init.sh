#!/bin/bash

# Ensure in the correct directory
cd "$(dirname "$0")"

# Initialize Terraform
echo "Initializing Terraform..."
terraform init

# Create bootstrap infrastructure
echo "Creating bootstrap infrastructure..."
terraform apply -auto-approve

# Output prompt information
echo "Bootstrap complete! You can now use these resources in your Terraform configurations."