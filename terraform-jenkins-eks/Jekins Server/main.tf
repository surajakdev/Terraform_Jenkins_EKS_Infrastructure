# VPC
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "jenkins-vpc"
  cidr = var.vpc_cidr

  azs             = data.aws_availability_zone.azs.names
  public_subnets  = var.public_subnets

  enable_dns_hostnames = true
  map_public_ip_on_launch = true

  tags = {
    Name = "jenkins-vpc"
    Terraform = "true"
    Environment = "dev"
  }

  public_subnet_tags = {
    Name = "jenkins-subnet"
  }

}

# Security group
module "sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "jenkins-sg"
  description = "Security Group for jenkins server"
  vpc_id      = module.vpc.vpc_id


  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      description = "HTTP"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "All"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  
  tags = {
    Name = "jenkins-sg"
}
}


# cidr_blocks = "0.0.0.0/0" to allow request from all ip ranges

# EC2

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "Jenkins-Server"

  instance_type          = var.instance_type
  key_name               = "jenkins-server-key"
  monitoring             = true
  vpc_security_group_ids = [module.sg.this.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  user_data = file("jenkins-install.sh")
  availability_zone = data.aws_availability_zones.azs.names[0]
  

  tags = {
    Name = "Jenkins-Server"
    Terraform = "true"
    Environment = "dev"
  }
}