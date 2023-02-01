## Mini Project for AltSchool third semester
### Project Description
- Using Terraform, create 3 EC2 instances and put them behind an Elastic Load Balancer
- Make sure the after applying your plan, Terraform exports the public IP addresses of the 3 instances to a file called host-inventory
- Get a .com.ng or any other domain name for yourself (be creative, this will be a domain you can keep using) and set it up with AWS Route53 within your  terraform plan, then add an A record for subdomain terraform-test that points to your ELB IP address.
- Create an Ansible script that uses the host-inventory file Terraform created to install Apache, set timezone to Africa/Lagos and displays a simple HTML page that displays content to clearly identify on all 3 EC2 instances.
- Your project is complete when one visits terraform-test.yoursdmain.com and it shows the content from your instances, while rotating between the servers as your refresh to display their unique content.
- Submit both the Ansible and Terraform files created

## Project Breakdown
### I will be creating the following resources using Terraform:
- VPC
- Target group
- Security group
- Load Balancer
- Launch Template
- Autoscaling group
- Route 53
- IP output file(host-inventory)

### I will be configuring the following using Ansible
- Apache

## Prerequisites
- AWS account
- Terraform installed
- Ansible installed
- Git account
- Domain name
- Terraform cloud account

# Solution
Kindly see code in repository

#Final Output
![ansibleplybk](https://user-images.githubusercontent.com/99274632/216162556-c9e63f69-873f-4565-adf5-7ff25059a6f4.PNG)
![yes-first](https://user-images.githubusercontent.com/99274632/216162590-fe8e2fb2-943f-4f44-b8b9-89dcf79e10f3.PNG)
![yes-third](https://user-images.githubusercontent.com/99274632/216162626-5ee8788b-ad94-454e-8cd2-9b0ac82452b1.PNG)
![yes-2nd](https://user-images.githubusercontent.com/99274632/216162614-50e4f0be-1a7f-4a8b-8616-b149317205bf.PNG)
