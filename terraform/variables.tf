# Region
variable "aws_region"{
    #region = "eu-north-1"
    description = "aws region where we are going to built this"
    type = string 
}

#project name
variable "project_name"{
    # aws-devops-sre-platform
    description = "name of our project"
    type = string
}

#vpc
variable "vpc_cidr" {
    description = "cidr block range for vpc"
    type = string
}

# public subnet
variable "public_subnet_cidr" {
    description = "cidr block for public subnet"
    type = string
  
}

variable "public_subnet_az_b_cidr" {
    description = "now we are using multi az in one region"
    type = string
}

# private subnet 
variable "private_subnet_cidr" {
    description = "cidr block range for public subnet "
    type = string
}
variable "private_subnet_az_b_cidr" {
    description = "now we are using multi az in one region"
    type = string
}

# availability zone
# variable "availability_zone" {
#     description = "availability zones for my project"
#     type = list(string)
# }