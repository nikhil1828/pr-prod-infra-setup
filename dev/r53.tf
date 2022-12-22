module "r53" {
  source = "../modules/r53"
  alias-name = module.cdn.cdn-hosted_zone_domain
  alias-zone-id = module.cdn.cdn-hosted_zone_id
  vpc-id = module.vpc.vpc_id
  alias-name-pvt-lb = module.lb.private-alb-dns
  alias-zone-id-pvt-lb = module.lb.private-alb-zone-id
}