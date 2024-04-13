# Deployment of Ngnix server on AWS EKS cluster using Jenkins and Terraform.

## Infrastructure built using terraform which will have jenkins server running in AWS VPC and then to manually trigger Jenkins pipline to make use of terraform template in github which contain's terraform module to deploy EKS cluster which will have ngnix server running in it.

### Initializing terraform at CLI of local machine.
![1](https://github.com/surajakdev/Terraform_Jenkins_EKS_Infrastructure/assets/158173648/2f618f73-d98d-4a9e-be1d-1f996b37e7e0)

### Creating jenkins server on ec2 in VPC according to terraform plan made using terraform code.
![2](https://github.com/surajakdev/Terraform_Jenkins_EKS_Infrastructure/assets/158173648/523b5a77-b28e-4a11-b12d-22916843eba5)


### Jenkins subnet
![3_JenkinsSubnet](https://github.com/surajakdev/Terraform_Jenkins_EKS_Infrastructure/assets/158173648/97608b0f-f3b0-4d03-b270-f1df3b5d05e8)

### Jenkins VPC
![4_JenkinsVpc](https://github.com/surajakdev/Terraform_Jenkins_EKS_Infrastructure/assets/158173648/c20ea2a3-a873-44ef-a461-06cd9c9125ee)

### Creation of security group for jenkins server in EC2 instance.
![5_CreatingSG](https://github.com/surajakdev/Terraform_Jenkins_EKS_Infrastructure/assets/158173648/a241cf2e-3458-49d6-9e3f-25c4a0b51dad)

### Security inbound rules 
![6_SG_inboundRules](https://github.com/surajakdev/Terraform_Jenkins_EKS_Infrastructure/assets/158173648/23469a0e-dad4-4a02-b4c6-7806d5aa9e84)





