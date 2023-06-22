
region = "us-east-1"
public_subnet_cidr_blocks = [
    "10.0.101.0/24",
    "10.0.102.0/24", 
    "10.0.103.0/24"
]
private_subnet_cidr_blocks = [
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24"
]


cidr_block = "10.0.0.0/16"

IP = "0.0.0.0/0"

azs = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c"
]
path_to_public_key  = "/home/ec2-user/.ssh/id_rsa.pub"
path_to_private_key = "/home/ec2-user/.ssh/id_rsa"