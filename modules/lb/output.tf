output "tg-arn" {
  value = aws_lb_target_group.web-tg.arn
}

output "tg2-arn" {
  value = aws_lb_target_group.web-tg2.arn
}

output "public-alb-dns" {
  value = aws_lb.web-ealb.dns_name
}

output "private-alb-dns" {
  value = aws_lb.web-enlb.dns_name
}

output "private-alb-zone-id" {
  value = aws_lb.web-enlb.zone_id
}