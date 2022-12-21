output "cdn-hosted_zone_id" {
  value = aws_cloudfront_distribution.ALB_distribution.hosted_zone_id
}