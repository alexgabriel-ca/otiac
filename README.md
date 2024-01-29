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
7. Security Group
8. Network ACL
9. Config Rules
10. EC2 Instances with Apache and NGINX in Public Subnet
11. EC2 instance in Prate Subnet

The EC2 instance public and private IP addresses are output at the end of the Terraform script so that you can verify whether Apache/NGINX were installed and configured correctly.

This is a very basic example of IAC via a DevOps workflow, and will be improved as I have time.
