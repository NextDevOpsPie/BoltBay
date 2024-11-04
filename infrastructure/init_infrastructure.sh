#!/bin/bash

# Create basic directory structure
mkdir -p environments/{dev,staging,prod}
mkdir -p modules/{vpc,ecs,security,s3}
mkdir -p bootstrap # Add bootstrap directory

# Create necessary files for each environment
for env in dev staging prod; do
    touch environments/$env/{main.tf,backend.tf,providers.tf,variables.tf,versions.tf}  # Add versions.tf
done

# Create necessary files for each module
for module in vpc ecs security s3; do
    touch modules/$module/{main.tf,variables.tf,outputs.tf,versions.tf}
done

# Create files in the bootstrap directory
touch bootstrap/{main.tf,init.sh,versions.tf}  # Add versions.tf
chmod +x bootstrap/init.sh

# Create README files
for module in vpc ecs security s3; do
    echo "# ${module} Module" > modules/$module/README.md
done
echo "# Bootstrap Configuration" > bootstrap/README.md

# Optional: Create specific files for certain modules
touch modules/vpc/data.tf
touch modules/security/rules.tf
touch modules/ecs/service.tf
touch modules/ecs/task-definition.tf
touch modules/s3/policies.tf

# Optional: Add basic content to versions.tf
for env in dev staging prod; do
    cat > environments/$env/versions.tf << EOL
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

# Output the complete directory structure for reference
echo "Created directory structure:"
tree .

echo "Terraform project directory structure successfully created, including all necessary module files and bootstrap configuration"