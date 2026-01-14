resource "aws_security_group" "lb_internal" {
  name   = format("%s-internal-load-balancer", var.project_name)
  vpc_id = data.aws_ssm_parameter.vpc.value

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "internal_ingress_80" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.lb_internal.id
}

resource "aws_security_group_rule" "internal_ingress_443" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.lb_internal.id
}

resource "aws_lb" "internal" {
  name               = format("%s-internal", var.project_name)
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_internal.id]
  subnets = [
    data.aws_ssm_parameter.subnet_public_1a.value,
    data.aws_ssm_parameter.subnet_public_1b.value,
    data.aws_ssm_parameter.subnet_public_1c.value
  ]
  enable_deletion_protection       = false
  enable_cross_zone_load_balancing = false

}

resource "aws_lb_listener" "internal" {
  load_balancer_arn = aws_lb.internal.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>Sistema em Manutenção</h1>"
      status_code  = "503"
    }
  }

}
