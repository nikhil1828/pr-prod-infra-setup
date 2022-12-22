resource "aws_route53_zone" "r53_hosted_zone" {
  name = "worldwidewebsite.dns"

}

resource "aws_route53_record" "r53_records" {
  zone_id = aws_route53_zone.r53_hosted_zone.zone_id
  name    = "public.worldwidewebsite.dns"
  type    = "A"

  alias {
    name                   = var.alias-name
    zone_id                = var.alias-zone-id
    evaluate_target_health = true
  }
}

resource "aws_route53_zone" "r53_hosted_zone-pvt" {
  name = "dnsfortomcat.dns"

  vpc {
    vpc_id = var.vpc-id
  }
}

resource "aws_route53_record" "r53_records-pvt" {
  zone_id = aws_route53_zone.r53_hosted_zone-pvt.zone_id
  name    = "private.dnsfortomcat.dns"
  type    = "A"

  alias {
    name                   = var.alias-name-pvt-lb
    zone_id                = var.alias-zone-id-pvt-lb
    evaluate_target_health = true
  }
}

