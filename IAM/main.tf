# Create AMI with wordpress installed for uture ASG
resource "aws_ami_from_instance" "wordpress" {
  name               = "terraform-wordpress"
  source_instance_id = aws_instance.wordpress.id
}