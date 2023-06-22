variable "public_subnet_cidr_blocks" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = [""]
}

variable "private_subnet_cidr_blocks" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = [""]
}

variable "public_subnet" {
  description = "Public subnets"
  type        = list(string)
  default     = [""]

}
variable "region" {
  description = "please provide a region information"
  type        = string
  default     = ""
}

variable "cidr_block" {
  description = "please provide a cidr_block information"
  type        = string
  default     = ""
}


#Security Group access IP for ports : 443,80,22
variable "IP" {
  description = "please provide a cidr_block information"
  type        = string
  default     = ""
}
variable "azs" {
  description = "please provide a az information"
  type        = list(any)
  default     = [""]
}

variable "private_subnets" {

  description = "Private subnets"
  type        = list(string)
  default     = [""]
}

variable "public_subnets" {
  description = "Public subnets"
  type        = list(string)
  default     = [""]
}

variable "cluster_identifier" {
  description = "cluster identifier of RDS database"
  type        = string
  default     = ""
}

variable "master_username" {
  description = "username for RDS database"
  type        = string
  default     = ""
}

variable "master_password" {
  description = "password for RDS database"
  type        = string
  default     = ""
}

variable "path_to_public_key" {
  description = "public key location on terraform instance"
  type        = string
  default     = ""
}