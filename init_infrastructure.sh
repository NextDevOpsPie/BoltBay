#!/bin/bash

# 创建基本目录结构
mkdir -p infrastructure/environments/{dev,staging,prod}
mkdir -p infrastructure/modules/{vpc,ecs,security,s3}
mkdir -p infrastructure/bootstrap  # 添加 bootstrap 目录

# 为每个环境创建必要文件
for env in dev staging prod; do
    touch infrastructure/environments/$env/{main.tf,backend.tf,providers.tf,variables.tf,versions.tf}  # 添加 versions.tf
done

# 为每个模块创建必要文件
for module in vpc ecs security s3; do
    touch infrastructure/modules/$module/{main.tf,variables.tf,outputs.tf,versions.tf}
done

# 创建 bootstrap 目录下的文件
touch infrastructure/bootstrap/{main.tf,init.sh,versions.tf}  # 添加 versions.tf
chmod +x infrastructure/bootstrap/init.sh

# 创建 README 文件
for module in vpc ecs security s3; do
    echo "# ${module} Module" > infrastructure/modules/$module/README.md
done
echo "# Bootstrap Configuration" > infrastructure/bootstrap/README.md

# 可选：为某些模块创建特定文件
touch infrastructure/modules/vpc/data.tf
touch infrastructure/modules/security/rules.tf
touch infrastructure/modules/ecs/service.tf
touch infrastructure/modules/ecs/task-definition.tf
touch infrastructure/modules/s3/policies.tf

# 可选：为 versions.tf 添加基本内容
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

# 设置执行权限
chmod +x init_infrastructure.sh

# 输出完整的目录结构供参考
echo "Created directory structure:"
tree infrastructure

echo "Terraform 项目目录结构已经成功创建，包括所有必要的模块文件和 bootstrap 配置"