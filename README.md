# Cloud Engineer Assessment – Bhaskar Divedi

## Overview

This project demonstrates the deployment of a Python Flask application on AWS using Terraform for Infrastructure as Code (IaC) and GitHub Actions for CI/CD automation.

The application is hosted on an Amazon EC2 instance and is publicly accessible over HTTP.
**Kindly find the attached snapshots for your reference**

**Application URL:**  
http://13.201.132.192

---

## Architecture

Developer → GitHub Repository → GitHub Actions → AWS EC2 → Flask Application → End Users

Whenever code is pushed to the `main` branch, GitHub Actions automatically deploys the latest version of the application to the EC2 instance.

---

## AWS Resources

The following AWS resources are provisioned using Terraform:

- EC2 Instance (t2.micro)
- Security Group
- IAM Role
- IAM Instance Profile
- IAM Policy Attachment

**AWS Region:** ap-south-1

---

## Security Configuration

### Security Group

#### Inbound Rules

- TCP 22 (SSH)
- TCP 80 (HTTP)

#### Outbound Rules

- All traffic allowed

### IAM Configuration

**Role:** BhaskarCloudEngineerRole

**Policy Attached:** AmazonSSMManagedInstanceCore

**Instance Profile:** bhaskar-cloud-profile

---

## Application

The application is built using Python Flask.

### Features

- Simple and lightweight web application
- Publicly accessible through HTTP
- Automated deployment using GitHub Actions
- Infrastructure managed using Terraform

---

## Terraform Resources

Terraform is used to provision and manage the infrastructure.

Resources created:

- aws_security_group
- aws_iam_role
- aws_iam_role_policy_attachment
- aws_iam_instance_profile
- aws_instance

---

## CI/CD Pipeline

GitHub Actions is used to automate deployments.

### Workflow

1. Developer pushes code to GitHub.
2. GitHub Actions workflow is triggered.
3. GitHub Actions connects to the EC2 instance through SSH.
4. Latest code is pulled from GitHub.
5. Application is deployed automatically.

This reduces manual effort and ensures consistent deployments.

---

## Design Decisions

I chose Terraform because it allows infrastructure to be managed as code, making deployments repeatable and easier to maintain.

I used an EC2 instance because it provides full control over the server and is suitable for a simple Flask application.

Flask was selected because it is lightweight, easy to develop with, and quick to deploy.

An IAM Role was attached to the EC2 instance instead of storing AWS credentials on the server. This follows AWS security best practices.

GitHub Actions was used to automate deployments and remove manual deployment steps.

---

## Trade-offs Considered

To keep the solution simple and focused on the assessment requirements, I used a single EC2 instance.

Services such as Load Balancers, Auto Scaling Groups, and multi-instance deployments were not included because they would increase complexity and cost.

Deployment is performed using SSH through GitHub Actions, which is simple and effective for a small project.

### Limitation

The application runs on a single EC2 instance, which creates a single point of failure. If the instance becomes unavailable, the application will also be unavailable.

---

## Cost Awareness

Cost optimization was considered during the design of this project.

A t2.micro instance was selected because it provides sufficient resources while keeping infrastructure costs low.

Only the resources required for the assessment were provisioned.

Additional services such as Load Balancers and Auto Scaling Groups were intentionally excluded to minimize costs and keep the architecture simple.

---

## Deployment Steps

### Prerequisites

- AWS Account
- Terraform Installed
- Git Installed
- AWS Credentials Configured

### Deploy Infrastructure

```bash
terraform init
terraform plan
terraform apply
```

After deployment, access the application using the EC2 public IP address.

---

## Repository Structure

```text
.github/
└── workflows/
    └── deploy.yml

app/
├── app.py
└── requirements.txt

terraform/
├── main.tf
└── provider.tf

README.md
architecture-diagram.png
```

---

## Future Improvements

- Configure HTTPS using SSL/TLS certificates
- Add an Application Load Balancer
- Implement Auto Scaling Groups
- Containerize the application using Docker
- Deploy using ECS or EKS
- Add monitoring and alerting with CloudWatch

---

## Author

**Bhaskar Divedi**

This project was completed as part of a Cloud Engineer assessment to demonstrate AWS infrastructure provisioning, CI/CD automation, and cloud deployment practices.
