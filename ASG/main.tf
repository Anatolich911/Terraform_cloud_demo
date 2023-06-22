
data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "shtyrka"
    workspaces = {
      name = "VPC"
    }
  }
}
module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"

  # Autoscaling group
  name = "example-asg"

  min_size                  = 0
  max_size                  = 1
  desired_capacity          = 1
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  vpc_zone_identifier       = data.terraform_remote_state.vpc.outputs.public_subnets


  # Launch template
  launch_template_name        = "example-asg"
  launch_template_description = "Launch template example"
  update_default_version      = true

  image_id          = "ami-ebd02392"
  instance_type     = "t3.micro"
  ebs_optimized     = true
  enable_monitoring = true






  launch_template {
    id      = aws_launch_template.my_launch_template.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = "asginstance"
    propagate_at_launch = true
  }
}
resource "aws_autoscaling_policy" "scale_up" {
  name                   = "scale_up"
  policy_type            = "SimpleScaling"
  autoscaling_group_name = aws_autoscaling_group.wordpress_asg.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "1"   # add one instance
  cooldown               = "300" # cooldown period after scaling
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "asg-scale-down"
  autoscaling_group_name = aws_autoscaling_group.wordpress_asg.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "-1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

# Application Load Balancer
resource "aws_alb" "application-lb" {
  name               = "project-alb"
  internal           = false
  ip_address_type    = "ipv4"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.asg-sec-group.id]
  subnets            = data.aws.availability_zones.all.names
}

# Target group
resource "aws_alb_target_group" "project-tg" {

  name        = "project-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  health_check {
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    port                = 80
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 3
    matcher             = 302

  }
}

# Creating Listener
resource "aws_alb_listener" "alb-listener" {
  load_balancer_arn = aws_alb.application-lb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_alb_target_group.project-tg.arn
    type             = "forward"
  }
}
