data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_launch_template" "template" {
  image_id               = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.public_key_name
  vpc_security_group_ids = [var.instance_sg_id]

  user_data = data.template_cloudinit_config.cloudinit-instance.rendered
}

resource "aws_autoscaling_group" "group" {
  name                      = var.asg_name
  vpc_zone_identifier       = var.public_subnets
  desired_capacity          = var.desired_capacity
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_grace_period = 300
  // health_check_type         = "ELB"
  health_check_type = "EC2"
  force_delete      = true

  target_group_arns = [aws_lb_target_group.test.arn]

  launch_template {
    id      = aws_launch_template.template.id
    version = "$Latest"
  }
}

# Application Load Balancer
resource "aws_lb" "load_balancer" {
  internal        = var.internal_lb
  security_groups = [var.alb_sg_id]
  subnets         = var.public_subnets
  idle_timeout    = 30
}

resource "aws_lb_target_group" "test" {
  name_prefix = "lb-tg-"
  port        = var.app_port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id

}

resource "aws_alb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  protocol          = "HTTP"
  port              = 80

  default_action {
    target_group_arn = aws_lb_target_group.test.arn
    type             = "forward"
  }
}
