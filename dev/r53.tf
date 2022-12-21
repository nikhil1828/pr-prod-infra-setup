module "r53" {
  source = "../modules/r53"
  vpc-id = module.vpc.vpc_id
  alias-name = module.lb.public-alb-dns
  alias-zone-id = module.cdn.cdn-hosted_zone_id
}