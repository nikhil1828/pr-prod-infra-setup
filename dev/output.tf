# output "EC2-IP" {
#   value = module.ec2.ec2-details
# }

# output "public-sg-id" {
#     value = module.sg.sg-id //for {k,v in module.sg.}
# }

# output "sg_id" {
#   value = {for b , a in aws_security_group.allow_tls: b => a.id}
# }

output "public-alb-dns" {
  value = module.lb.public-alb-dns
}