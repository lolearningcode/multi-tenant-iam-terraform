# Dynamic IAM Role Creation for Multi-Tenant Environments

This Terraform project demonstrates how to dynamically create scoped IAM roles and policies for multiple customers in a multi-tenant AWS environment.

## 🔧 Use Case
Each customer gets:
- A dedicated IAM role
- A custom IAM policy with access to only their own S3 bucket

## 📂 How It Works
- Customers are defined in `terraform.tfvars` as a map
- Terraform uses `for_each` to loop through the customer list
- Roles, policies, and attachments are created for each tenant

## 📁 Files
- `main.tf`: Resources for IAM roles, policies, and attachments
- `variables.tf`: Input schema for customer map
- `terraform.tfvars`: Example customer data

## 🚀 Example Output
IAM Role: `iam-role-customerA`  
Policy: `customer-policy-customerA`  
Access: `s3:GetObject` on `customer-a-data`

## 🧪 Usage
```bash
terraform init
terraform apply
