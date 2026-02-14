# aws region
aws_region  = "eu-north-1"

# my project name 
project_name = "aws-devops-sre-platform"

#my projects network cidr block ranges
vpc_cidr = "10.0.0.0/16"
public_subnet_cidr = ["10.0.1.0/24","10.0.3.0/24"]
private_subnet_cidr = ["10.0.2.0/24","10.0.4.0/24"]
public_subnet_az_a_cidr = "10.0.3.0/24"
private_subnet_az_a_cidr = "10.0.4.0/24"

# availability zones
# availability_zone = ["eu-north-1a","eu-north-1b"]
# how to use multiple availability zones as a varibales like var.availabilityzone
