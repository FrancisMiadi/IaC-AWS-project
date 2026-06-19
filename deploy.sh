#!/bin/bash

set -e

echo "Deploying Terraform..."

cd terraform
terraform init
terraform apply -auto-approve

EC2_IP=$(terraform output -raw ec2_public_ip)
S3_URL=$(terraform output -raw frontend_url)

echo "Updating frontend with EC2 IP..."

sed "s|YOUR_EC2_PUBLIC_IP|$EC2_IP|g" ../frontend/index.html > /tmp/index.html

aws s3 cp /tmp/index.html s3://$(terraform output -raw s3_bucket_name)/index.html

echo "DONE"
echo "Frontend: $S3_URL"
echo "Backend: http://$EC2_IP:5000"