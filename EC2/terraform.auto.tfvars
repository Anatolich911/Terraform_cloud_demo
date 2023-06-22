
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

IP = "0.0.0.0/0"


path_to_public_key  = "/home/ec2-user/.ssh/id_rsa.pub"
path_to_private_key = "/home/ec2-user/.ssh/id_rsa"

region              = "us-east-1"
path_to_public_key  = "/home/ec2-user/.ssh/id_rsa.pub"
path_to_private_key = "/home/ec2-user/.ssh/id_rsa"
instance_username   = "ec2-user"
cidr_block          = "10.0.0.0/16"
sec_group_name      = "my_sg"
public_subnet1      = "10.0.4.0/24"
public_subnet2      = "10.0.5.0/24"
public_subnet3      = "10.0.6.0/24"
private_subnet1     = "10.0.101.0/24"
private_subnet2     = "10.0.102.0/24"
private_subnet3     = "10.0.103.0/24"
availability_zone   = "us-east-1a"
azs = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c"
]

database_name      = "my_database"
cluster_identifier = "database-1"
master_username    = "team1"
master_password    = "wH8ru2XgaZFY"

tags = {
  Dept = "Devops"
  Team = "Team1"
}

#domain = "wakulovszki.com"
#zone_id = "Z0593479FX68DGYT6E83"

domain = "treenetsolution.com"
zone_id = "Z02170421JNU7XEVMBN6G"