output "instance_public_ip" {
value = aws_instance.wordpress.public_ip
}


output "vpc_security_group_ids" {
value = default_security_group_id
}
