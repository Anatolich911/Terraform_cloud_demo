
data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "shtyrka"
    workspaces = {
      name = "VPC"
    }
  }
}







# Create ASG

resource "aws_autoscaling_group" "wordpress_asg" {
  name                = "wordpress_asg"
  max_size            = 99
  min_size            = 1
  health_check_type   = "ELB"
  desired_capacity    = 1
  target_group_arns   = [aws_alb_target_group.project-tg.arn]
  vpc_zone_identifier = data.terraform_remote_state.vpc.outputs.public_subnets
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
  security_groups    = [data.terraform_remote_state.vpc.aws_security_group.my_sg.id]
  subnets            = data.terraform_remote_state.vpc.outputs.public_subnets
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
