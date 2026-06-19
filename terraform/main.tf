provider "aws" {
  region = var.region
}

# -------------------------
# S3 FRONTEND
# -------------------------
resource "aws_s3_bucket" "frontend" {
  bucket = var.bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "frontend" {
  bucket = aws_s3_bucket.frontend.id
  index_document { suffix = "index.html" }
}

resource "aws_s3_bucket_public_access_block" "frontend" {
  bucket = aws_s3_bucket.frontend.id
  block_public_acls = false
  block_public_policy = false
  ignore_public_acls = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "frontend" {
  bucket = aws_s3_bucket.frontend.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = "*"
      Action = "s3:GetObject"
      Resource = "${aws_s3_bucket.frontend.arn}/*"
    }]
  })
}

# Upload index.html
resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.frontend.id
  key    = "index.html"
  source = "../frontend/index.html"
  content_type = "text/html"
}



# -------------------------
# EC2 BACKEND
# -------------------------
resource "aws_instance" "backend" {
  ami           = "ami-0261755bbcb8c4a84"  # Ubuntu 22.04 LTS (us-east-1)
  instance_type = "t3.micro"

  associate_public_ip_address = true        # Required to be reachable

  vpc_security_group_ids = [aws_security_group.sg.id]
  user_data = file("../backend/user_data.sh")

  tags = {
    Name = "sentiment-backend-instance"
  }
}

resource "aws_security_group" "sg" {
  name = "sentiment-sg-1"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}