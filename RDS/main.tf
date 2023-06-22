
data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "shtyrka"
    workspaces = {
      name = "VPC"
    }
  }
}





#Create subnet group for RDS
resource "aws_db_subnet_group" "project_db_subnet_group" {
  name       = "project_db_subnet_group"
  subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnets
}

#Create cluster RDS
resource "aws_rds_cluster_instance" "writer_instance" {
  count                = 1
  identifier           = "writer-instance"
  cluster_identifier   = aws_rds_cluster.db_instance.id
  instance_class       = "db.t2.small"
  engine               = "aurora-mysql"
  db_subnet_group_name = aws_db_subnet_group.project_db_subnet_group.id
}

resource "aws_rds_cluster_instance" "reader_instances" {
  count                = 3
  identifier           = "example-reader-${count.index + 1}"
  cluster_identifier   = aws_rds_cluster.db_instance.id
  instance_class       = "db.t2.small"
  engine               = "aurora-mysql"
  db_subnet_group_name = aws_db_subnet_group.project_db_subnet_group.id
}

resource "aws_rds_cluster" "db_instance" {
  cluster_identifier     = var.cluster_identifier
  engine                 = "aurora-mysql"
  availability_zones     = var.availability_zones
  database_name          = var.database_name
  master_username        = var.master_username
  master_password        = var.master_password
  vpc_security_group_ids = [aws_security_group.database_sg.id]
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.project_db_subnet_group.id
}

#Create security group for RDS

resource "aws_security_group" "database_sg" {
  name        = "database-sg"
  description = "Allow MySQL access from EC2 instance"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
}



resource "aws_route53_record" "wordpress" {
  zone_id = var.zone_id
  name    = "wordpress.${var.domain}"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_alb.application-lb.dns_name]
}
variable domain {
  type = string 

}

resource "aws_route53_record" "database_writer_endpoint" {
  zone_id = var.zone_id
  name    = "writer.${var.domain}"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_rds_cluster_instance.writer_instance[0].endpoint]
}

resource "aws_route53_record" "database_reader_endpoint1" {
  zone_id = var.zone_id
  name    = "reader1.${var.domain}"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_rds_cluster_instance.reader_instances[0].endpoint]
}

resource "aws_route53_record" "database_reader_endpoint2" {
  zone_id = var.zone_id
  name    = "reader2.${var.domain}"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_rds_cluster_instance.reader_instances[1].endpoint]
}

resource "aws_route53_record" "database_reader_endpoint3" {
  zone_id = var.zone_id
  name    = "reader3.${var.domain}"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_rds_cluster_instance.reader_instances[2].endpoint]
}