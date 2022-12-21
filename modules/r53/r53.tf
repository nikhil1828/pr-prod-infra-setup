resource "aws_route53_zone" "r53_hosted_zone" {
  name = "nikhil.net"

  vpc {
    vpc_id = var.vpc-id
  }
}

resource "aws_route53_record" "r53_records" {
  zone_id = aws_route53_zone.r53_hosted_zone.zone_id
  name    = "test.nikhil.net"
  type    = "A"

  alias {
    name                   = var.alias-name//"${aws_lb.example.dns_name}"
    zone_id                = var.alias-zone-id//"${aws_lb.example.zone_id}"
    evaluate_target_health = true
  }
}