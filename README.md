# BoltBay

## Getting started

first install the npm dependencies:

```bash
npm install
```

run the development server:

```bash
npm run dev
```

Finally, open [http://localhost:3000](http://localhost:3000) in your browser to view the website.

Here's the English version of the README.md up to the initialization steps:

````markdown
# BoltBay Infrastructure

BoltBay is a microservices-driven e-commerce platform. This repository contains the infrastructure code managed with Terraform.

## Project Structure

```plaintext
infrastructure/
├── bootstrap/              # Bootstrap infrastructure configuration
│   ├── main.tf            # S3 and DynamoDB configuration
│   └── init.sh            # Initialization script
├── environments/          # Environment-specific configurations
│   ├── dev/              # Development environment
│   ├── staging/          # Staging environment
│   └── prod/             # Production environment
└── modules/              # Reusable infrastructure modules
    ├── vpc/             # VPC network configuration
    ├── ecs/             # ECS cluster configuration
    ├── security/        # Security groups configuration
    └── s3/              # S3 storage configuration
```
````

## Prerequisites

### Install Required Tools

```bash
# Install AWS CLI
brew install awscli  # MacOS
# or
sudo apt-get install awscli  # Ubuntu/Debian

# Install Terraform
brew install terraform  # MacOS
# or
sudo apt-get install terraform  # Ubuntu/Debian
```

**Configure AWS Credentials**

```bash
aws configure
# Enter the following information:
# AWS Access Key ID
# AWS Secret Access Key
# Default region: ap-southeast-2
# Default output format: json
```

## Initialization Steps

**Create Infrastructure Storage**

```bash
# Navigate to bootstrap directory
cd infrastructure/bootstrap

# Initialize and create base resources
terraform init
terraform apply
```

 **Initialize Development Environment**

```bash
cd infrastructure/environments/dev

# Initialize Terraform
terraform init

# Review the execution plan
terraform plan

# Apply the configuration
terraform apply
```
