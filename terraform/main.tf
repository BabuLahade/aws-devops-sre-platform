# resource "aws_s3_bucket" "test_bucket" {
#     bucket = "${var.project_name}-test-bucket"

#     tags = {
#       Name = var.project_name
#       Environment = "dev"
#     }
  
# }

#####    VPC    ######

resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr

    enable_dns_support = true
    enable_dns_hostnames = true

    tags={
        Name= "${var.project_name}-vpc"

    }
}



#######     INTERNET GATEWAY  ##########

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id

    tags={
        Name="${var.project_name}-igw"
    }
}

############  Public & PRIVATE subnets #######

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.public_subnet_cidr
    map_public_ip_on_launch = true
    availability_zone = "eu-north-1a"

    tags = {
      Name = "${var.project_name}-public-subnet"
    }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_az_b_cidr
  map_public_ip_on_launch = true
  availability_zone       = "eu-north-1b"

  tags = {
    Name = "${var.project_name}-public-subnet-b"
  }
}


resource "aws_subnet" "private" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.private_subnet_cidr
    availability_zone = "eu-north-1a"

    tags ={
        Name = "${var.project_name}-private-subnet"
    }
}
resource "aws_subnet" "private_b" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.private_subnet_az_b_cidr
    availability_zone = "eu-north-1b"

    tags ={
        Name = "${var.project_name}-private-subnet-b"
    }
}



###### Route Table ############

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name="${var.project_name}-public-rt"
  }
}
resource "aws_route_table_association" "public_assoc" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public.id

}
resource "aws_route_table_association" "public_b_assoc" {
    subnet_id = aws_subnet.public_b.id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
    vpc_id = aws_vpc.main.id

    tags = {
      Name = "${var.project_name}-private-rt"
    }
}

resource "aws_route_table_association" "private-assoc" {
    route_table_id = aws_route_table.private.id
    subnet_id = aws_subnet.private.id
}

resource "aws_route_table_association" "private_b_assoc" {
    route_table_id = aws_route_table.private.id
    subnet_id = aws_subnet.private_b.idS
}