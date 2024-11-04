#!/bin/bash

# 确保在正确的目录
cd "$(dirname "$0")"

# 初始化 Terraform
echo "Initializing Terraform..."
terraform init

# 创建基础设施
echo "Creating bootstrap infrastructure..."
terraform apply -auto-approve

# 输出提示信息
echo "Bootstrap complete! You can now use these resources in your Terraform configurations."