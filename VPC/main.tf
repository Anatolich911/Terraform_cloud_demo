
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my_vpc"
  cidr = var.cidr_block

  azs             =  ["${var.region}a", "${var.region}b","${var.region}c"]
  private_subnets = var.private_subnet_cidr_blocks
  public_subnets  = var.public_subnet_cidr_blocks

  enable_nat_gateway = true
  single_nat_gateway = true
  enable_vpn_gateway = true
  private_subnet_names = ["private1", "private2", "private3"]
  public_subnet_names = ["public1", "public2", "public3"]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}