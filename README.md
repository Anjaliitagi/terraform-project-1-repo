# Terraform Project - AWS Infrastructure Deployment with Jenkins CI/CD

## 📌 Project Overview
This project demonstrates **Infrastructure as Code (IaC)** using **Terraform** to provision AWS resources, integrated with a **Jenkins CI/CD pipeline** for automated deployment.
The resources include:

- VPC
- Subnet
- Security Group (allowing SSH and HTTP)
- EC2 Instance
- S3 Bucket (with unique name)

Terraform stores its state in an S3 backend, and Jenkins is used for pipeline automation.

The pipeline is triggered whenever code is pushed to GitHub, ensuring that infrastructure changes are validated, planned, and applied automatically.
---
## 🛠️ Tools & Technologies Used
- **Terraform** – Infrastructure provisioning
- **AWS** – Cloud provider (EC2, Security Groups, Networking)
- **Jenkins** – CI/CD automation
- **GitHub** – Version control
- **Git** – Code management
---

