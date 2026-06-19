###############################################################
# outputs.tf — Arabic Sentiment Analysis
###############################################################

# S3 Static Website URL (Frontend)
output "frontend_url" {
  description = "S3 Static Website URL"
  value       = "http://${aws_s3_bucket.frontend.bucket}.s3-website-${var.region}.amazonaws.com"
}

# EC2 Public IP (Backend)
output "ec2_public_ip" {
  description = "EC2 Public IP Address"
  value       = aws_instance.backend.public_ip
}

# Backend API URL (Flask)
output "backend_api_url" {
  description = "Flask API Endpoint"
  value       = "http://${aws_instance.backend.public_ip}:5000/predict"
}

/* locals {
  backend_ip = aws_instance.backend.public_ip
}

output "ec2_public_ip" {
  value = local.backend_ip
}

output "backend_api_url" {
  value = "http://${local.backend_ip}:5000/predict"
} */

# S3 Bucket Name (needed for uploads)
output "s3_bucket_name" {
  description = "S3 bucket name for frontend"
  value       = aws_s3_bucket.frontend.bucket
}

