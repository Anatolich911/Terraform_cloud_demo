
region              = "us-east-2"
path_to_public_key  = "/home/ec2-user/.ssh/id_rsa.pub"
path_to_private_key = "/home/ec2-user/.ssh/id_rsa"
instance_username   = "ec2-user"
cidr_block          = "10.2.0.0/16"
sec_group_name      = "my_sg"
public_subnet1      = "10.2.1.0/24"
public_subnet2      = "10.2.2.0/24"
public_subnet3      = "10.2.3.0/24"
private_subnet1     = "10.2.101.0/24"
private_subnet2     = "10.2.102.0/24"
private_subnet3     = "10.2.103.0/24"
availability_zone   = "us-east-2a"
availability_zones = [
  "us-east-2a",
  "us-east-2b",
  "us-east-2c"
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