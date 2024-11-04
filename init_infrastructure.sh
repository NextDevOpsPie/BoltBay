#!/bin/bash

# Create basic directory structure
mkdir -p infrastructure/environments/{dev,staging,prod}
mkdir -p infrastructure/modules/{vpc,ecs,security,s3}
mkdir -p infrastructure/bootstrap  # Add bootstrap directory

# Create necessary files for each environment
for env in dev staging prod; do
    touch infrastructure/environments/$env/{main.tf,backend.tf,providers.tf,variables.tf,versions.tf}  # Add versions.tf
done

# Create necessary files for each module
for module in vpc ecs security s3; do
    touch infrastructure/modules/$module/{main.tf,variables.tf,outputs.tf,versions.tf}
done

# Create files in the bootstrap directory
touch infrastructure/bootstrap/{main.tf,init.sh,versions.tf}  # Add versions.tf
chmod +x infrastructure/bootstrap/init.sh

# Create README files
for module in vpc ecs security s3; do
    echo "# ${module} Module" > infrastructure/modules/$module/README.md
done
echo "# Bootstrap Configuration" > infrastructure/bootstrap/README.md

# Optional: Create specific files for certain modules
touch infrastructure/modules/vpc/data.tf
touch infrastructure/modules/security/rules.tf
touch infrastructure/modules/ecs/service.tf
touch infrastructure/modules/ecs/task-definition.tf
touch infrastructure/modules/s3/policies.tf

# Optional: Add basic content to versions.tf
for env in dev staging prod; do
    cat > infrastructure/environments/$env/versions.tf << EOL
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  
  required_version = ">= 1.0.0"
}
EOL
done

# Set execution permission
chmod +x init_infrastructure.sh

# Output the complete directory structure for reference
echo "Created directory structure:"
tree infrastructure

echo "Terraform project directory structure successfully created, including all necessary module files and bootstrap configuration"