# it will shows output values for those
# output for vpc
output "vpc_id" {
    value = aws_vpc.main.id
}

#outputs for subnets
output "public_subnet_id" {
    value=aws_subnet.public.id
}

output "private_subnet_id"{
    value= aws_subnet.private.id
}