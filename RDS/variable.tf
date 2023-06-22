variable "region" {
  description = "please provide a region information"
  type        = string
  default     = ""
}
}
variable "azs" {
  description = "please provide a az information"
  type        = list(any)
  default     = [""]
}

variable "cidr_block" {
  description = "please provide a cidr_block information"
  type        = string
  default     = ""
}

variable "sec_group_name" {
  description = "please provide a sec_group_name information"
  type        = string
  default     = ""
}

variable "path_to_public_key" {
  description = "public key location on terraform instance"
  type        = string
  default     = ""
}

variable "path_to_private_key" {
  description = "private key location on terraform instance"
  type        = string
  default     = ""
}

variable "instance_username" {
  description = "user to ssh to remote host"
  type        = string
  default     = ""
}

variable "public_subnet1" {
  description = "cidr-block for public subnet"
  type        = string
  default     = ""
}

variable "public_subnet2" {
  description = "cidr-block for public subnet"
  type        = string
  default     = ""
}

variable "public_subnet3" {
  description = "cidr-block for public subnet"
  type        = string
  default     = ""
}

variable "private_subnet1" {
  description = "cidr-block for private subnet"
  type        = string
  default     = ""
}

variable "private_subnet2" {
  description = "cidr-block for private subnet"
  type        = string
  default     = ""
}

variable "private_subnet3" {
  description = "cidr-block for private subnet"
  type        = string
  default     = ""
}
variable "availability_zone" {
  description = "availability zone in region"
  type        = string
  default     = ""
}

variable "availability_zones" {
  description = "all availability zones in region"
  type        = list(any)
  default     = []
}

variable "database_name" {
  description = "name of RDS database"
  type        = string
  default     = ""
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



variable "tags" {
  description = "please provide a tags information"
  type        = map(any)
  default     = {}
}

variable "zone_id" {
  description = "provide zone id"
  type = string
  default = ""
} 