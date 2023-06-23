data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "shtyrka"
    workspaces = {
      name = "VPC"
    }
  }
}
data "terraform_remote_state" "rds" {
  backend = "remote"

  config = {
    organization = "shtyrka"
    workspaces = {
      name = "RDS"
    }
  }
}



#1 Find AMI Linux-2

data "aws_ami" "amazon-2" {
  most_recent = true

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
  owners = ["amazon"]
}


# 2. Createh VM 
resource "aws_instance" "wordpress" {
  availability_zone      = var.availability_zone
  ami                    = data.aws_ami.amazon-2.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.project_keypair.key_name

  tags = {
    "Name" : "wordpress_for_ami"
  }


  connection {
    type        = "ssh"
    user        = var.instance_username
    private_key = file(var.path_to_private_key)
    host        = aws_instance.wordpress.public_ip
  }

  provisioner "remote-exec" {

    inline = [
      "sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2",
      "sudo yum install php php-{pear,cgi,common,curl,mbstring,gd,mysqlnd,gettext,bcmath,json,xml,fpm,intl,zip} -y",
      "sudo amazon-linux-extras install php8.0 -y",
      "sudo yum install -y httpd mariadb-server",
      "sudo wget https://wordpress.org/latest.tar.gz",
      "sudo tar -xzf latest.tar.gz",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
      "sudo cp -r wordpress/* /var/www/html/",
      "sudo chown -R apache:apache /var/www/html/",
      "sudo mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php",
      "sudo sed -i 's/username_here/${var.master_username}/g' /var/www/html/wp-config.php",
      "sudo sed -i 's/localhost/${data.terraform_remote_state.rds.outputs.db_listener_endpoint}/g' /var/www/html/wp-config.php",
      "sudo sed  -i 's/database_name_here/${var.database_name}/g' /var/www/html/wp-config.php",
      "sudo sed  -i 's/password_here/${var.master_password}/g' /var/www/html/wp-config.php"
    ]
  }
}


# Launch template

resource "aws_launch_template" "my_launch_template" {

  name          = "my_launch_template"
  image_id      = aws_instance.wordpress.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.project_keypair.id
  network_interfaces {
    associate_public_ip_address = true
    
  }
}

# 1. Create key pair

resource "aws_key_pair" "project_keypair" {
  key_name   = "project_keypair"
  public_key = file(var.path_to_public_key)
}