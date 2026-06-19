# IaC-AWS-project

# Infrastructure as Code (IaC) on AWS using Terraform

## Overview

This project was developed and presented as part of an educational session on **Infrastructure as Code (IaC)** organized by the **AWS Cloud Club at Birzeit University**.

The objective of the project was to demonstrate how Terraform can be used to automate the provisioning and management of cloud infrastructure on AWS. During the session, participants were introduced to the core concepts of IaC and observed how an entire cloud environment could be deployed consistently and efficiently using code.

## Architecture

The infrastructure provisions a simple two-tier application environment consisting of:

* Frontend S3 instance
* Backend EC2 instance
* Security Groups
* SSH access configuration
* Infrastructure automation through Terraform


## Features

* Fully automated AWS infrastructure deployment.
* Infrastructure defined as code using Terraform.
* Modular and reusable Terraform configuration.
* Secure communication between frontend and backend instances.
* Controlled inbound and outbound traffic through Security Groups.
* Easy replication of environments.
* Version-controlled infrastructure configuration.


## Terraform Components

The project includes:

* Provider configuration
* Networking resources
* EC2 instance definitions
* Security Group configurations
* Variables
* Outputs

### Example Workflow

```bash
terraform init

terraform validate

terraform plan

terraform apply
```

## Learning Outcomes

Through this project, participants learned:

* Fundamentals of Infrastructure as Code (IaC)
* Benefits of Terraform for cloud automation
* AWS networking concepts
* Security Group design and access control
* Automated infrastructure provisioning
* Infrastructure versioning and reproducibility
* Cloud deployment best practices

## Educational Impact

This project was presented as part of the educational activities of the AWS Cloud Club at Birzeit University. The session aimed to bridge the gap between theoretical cloud concepts and practical implementation by demonstrating real-world AWS infrastructure deployment using Terraform.

## Technologies

* Terraform
* AWS EC2
* AWS VPC
* AWS Security Groups
* AWS IAM

## Author

Francis Ihab Miadi

Educational Team Member
AWS Cloud Club – Birzeit University

Cloud Computing | AWS | Terraform | Infrastructure as Code
