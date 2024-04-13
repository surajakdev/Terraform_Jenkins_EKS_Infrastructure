terraform {
    backend "s3" {
        bucket = "cicd-terraform-eks"
        key = "jenkins/terraform.tfstate"
        region = "us-east-1"
    }
}

# use of variables is not recommended in this block