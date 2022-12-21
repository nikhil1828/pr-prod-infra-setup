resource "aws_lb_target_group" "web-tg" {
  name     = var.tg-name
  port     = var.tg-port
  protocol = "HTTP"
  target_type = "instance"
  vpc_id   = var.tg_vpc
  
}

resource "aws_lb_target_group" "web-tg2" {
  name     = var.tg-name-2
  port     = var.tg-port-2
  protocol = "HTTP"
  target_type = "instance"
  vpc_id   = var.tg_vpc
  health_check {
    port = var.tg-port-2
  }
}

resource "aws_lb" "web-ealb" {
  name               = var.lb_name
  internal           = var.internal
  load_balancer_type = "application"
  ip_address_type = "ipv4"
  security_groups    = [var.sg]
  subnets = [for k in var.sub-id: k.snetid]
  tags = {
    Environment = "${var.environment}-${var.stage}-LB"
  }
}

resource "aws_lb" "web-enlb" {
  name               = var.lb_name-2
  internal           = var.internal-2
  load_balancer_type = "application"
  ip_address_type = "ipv4"
  security_groups    = [var.sg2]
  subnets = [for k in var.sub-id-2: k.snetid]
  tags = {
    Environment = "${var.environment}-${var.stage}-LB"
  }
}

//LISTENER OF LB
resource "aws_lb_listener" "web-ealb-to-web-tg" {
  load_balancer_arn = aws_lb.web-ealb.arn
  port              = "80"
  protocol          = "HTTP"
  # ssl_policy        = "ELBSecurityPolicy-2016-08"
  # certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = var.action-type
    target_group_arn = aws_lb_target_group.web-tg.arn
  }
}

resource "aws_lb_listener" "web-enlb-to-web-tg" {
  load_balancer_arn = aws_lb.web-enlb.arn
  port              = "80"
  protocol          = "HTTP"
  # ssl_policy        = "ELBSecurityPolicy-2016-08"
  # certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = var.action-type
    target_group_arn = aws_lb_target_group.web-tg2.arn
  }
}
