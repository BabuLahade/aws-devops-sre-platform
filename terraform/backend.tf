# terraform {
#     backend "s3"{
#         #bucket name
#         bucket = "aws-project-terraform-state-file"
#         #path inside the bucket
#         key = "envs/dev/terraform.state"

#         region = "ap-south-1"
#         #dyanmodb table for state lock
#         dynamodb_table = "terraform-locks"

#         #encrypt
#         encrypt= true
#     }
# }