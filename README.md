# Deployment of Nginx server on AWS EKS cluster using Jenkins and Terraform.

## Infrastructure built using terraform which will have Jenkins server running in AWS VPC and then to manually trigger Jenkins pipeline to make use of terraform template in github which contains terraform module to deploy EKS cluster which will have Nginx server running in it.

### Initializing terraform at CLI of local machine.
![1](https://github.com/surajakdev/Terraform_Jenkins_EKS_Infrastructure/assets/158173648/2f618f73-d98d-4a9e-be1d-1f996b37e7e0)

### Creating jenkins vpc and subnet according to terraform plan made using terraform code.
![2](https://github.com/surajakdev/Terraform_Jenkins_EKS_Infrastructure/assets/158173648/523b5a77-b28e-4a11-b12d-22916843eba5)

### Jenkins subnet
![3_JenkinsSubnet](https://github.com/surajakdev/Terraform_Jenkins_EKS_Infrastructure/assets/158173648/97608b0f-f3b0-4d03-b270-f1df3b5d05e8)

### Jenkins VPC
![4_JenkinsVpc](https://github.com/surajakdev/Terraform_Jenkins_EKS_Infrastructure/assets/158173648/c20ea2a3-a873-44ef-a461-06cd9c9125ee)

### Creation of security group for jenkins server to be setup from EC2 instance.
![5_CreatingSG](https://github.com/surajakdev/Terraform_Jenkins_EKS_Infrastructure/assets/158173648/a241cf2e-3458-49d6-9e3f-25c4a0b51dad)

### Security inbound rules 
![6_SG_inboundRules](https://github.com/surajakdev/Terraform_Jenkins_EKS_Infrastructure/assets/158173648/23469a0e-dad4-4a02-b4c6-7806d5aa9e84)

### Bash script to be used by terraform module for creating jenkins server.
#### The script will install jenkins and its dependencies followed by installation of git, terrraform and kubectl.
![7_BashScriptForInstallation](https://github.com/surajakdev/Terraform_Jenkins_EKS_Infrastructure/assets/158173648/2d5a69e5-4b0a-4243-8aa6-7c43dab3e539)

### CLI showing creation of jenkins server
![8_CreatingEc2JenkinsServer](https://github.com/surajakdev/Terraform_Jenkins_EKS_Infrastructure/assets/158173648/8109d6d8-fb33-46a4-9d00-feb58dde2e56)

### Jenkins installed
![9_JenkinsInstalled](https://github.com/surajakdev/Terraform_Jenkins_EKS_Infrastructure/assets/158173648/8a196723-b1f9-4d40-baa1-6f6e35520648)

### Pipeline script wrote inside jenkins configuration for running stages like picking up code from github.
![10_pipelineScript](https://github.com/surajakdev/Terraform_Jenkins_EKS_Infrastructure/assets/158173648/8c17a6f0-44dd-40d4-9445-187027d65daa)

### Then performing terraform init and validating in jenkins server.
![11_TerraformInitAndFormatting](https://github.com/surajakdev/Terraform_Jenkins_EKS_Infrastructure/assets/158173648/5007ddc5-e264-4015-a9b8-6c7f699065f4)

### Script for creating EKS cluster
![12_CreatingEksCluster](https://github.com/surajakdev/Terraform_Jenkins_EKS_Infrastructure/assets/158173648/b6c7e746-3ea3-4ccf-a839-7326fec41dd6)

### Ngnix server created at cluster
![13_nginixServiceCreatedpng](https://github.com/surajakdev/Terraform_Jenkins_EKS_Infrastructure/assets/158173648/de0ae719-a6d5-4135-8249-c99e34c49490)

### Ngnix running in cluster
![14_NgnixRunningInCluster](https://github.com/surajakdev/Terraform_Jenkins_EKS_Infrastructure/assets/158173648/bc2081cb-a4e5-48f2-ba0b-bfce23f50f81)
