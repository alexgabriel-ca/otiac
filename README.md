# Infrastructure as Code Demo

This project is designed to show the following workflow:
1. Modify Terraform script via VS Code
2. Commit to repository
3. Run Jenkins Pipeline
4. Review Output

The following AWS resources are created via the Terraform script, in both the ca-central-1 and us-west-1 regions.
1. VPC
2. Public Subnet
3. Private Subnet
4. Internet Gateway
5. Route Table
6. Route Table Association
7. S3 Bucket for storing Config Rule Results
8. Security Group
9. Network ACL
10. Config Rules
11. EC2 Instances with Apache and NGINX in Public Subnet
12. EC2 instance in Private Subnet

The EC2 instance public and private IP addresses are output at the end of the Terraform script so that you can verify whether Apache/NGINX were installed and configured correctly.

This project is an advanced example of leveraging the DevOps methodology to deploy infrastructure as code (IaC).
