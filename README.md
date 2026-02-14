# phase 0
now we are in phase 0 
in which we do using terrafom we crate s3 bucket and dynamod table for remote backend state lock file 
setup terraform github
s3 and dyanmodb
env variables outputs main backend files are added

# phase1
we are created vpc,subnets,igw,route table
'''bash
terraform init
terraform validate
terraform plan -var-file=envs/dev.tfvars
terraform apply -var-file=envs/dev.tfvars
