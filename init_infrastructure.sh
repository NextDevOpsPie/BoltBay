#!/bin/bash

mkdir -p infrastructure/environments/{dev,staging,prod}
mkdir -p infrastructure/modules/{vpc,ecs,security}

for env in dev staging prod; do
    touch infrastructure/environments/$env/{main.tf,backend.tf,providers.tf,variables.tf}
done

echo "Terraform 项目目录结构已经成功创建"

