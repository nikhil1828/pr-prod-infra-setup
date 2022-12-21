output "sg_id" {
  value = {for b , a in aws_security_group.allow_tls: b => a.id}
}
# output "sg-id" {
#   value = {for b , a in aws_security_group.ec2-sg: b => a.id}
# }
