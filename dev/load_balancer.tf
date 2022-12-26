module "lb" {
  source     = "../modules/lb"
  tg-name    = var.tg-name
  tg-name-2  = var.tg-name-2
  tg-port    = var.tg-port
  tg-port-2  = var.tg-port-2
  lb_name    = var.lb_name
  internal   = var.internal
  lb_name-2  = var.lb_name-2
  internal-2 = var.internal-2
  tg_vpc     = module.vpc.vpc_id
  sg         = lookup(module.sg.sg_id, "ec2-sg", null)
  sg2        = lookup(module.sg3.sg_id, "ec2-sg3", null)
  sub-id = {
    lb-sub1 = {
      snetid = lookup(module.vpc.pub_snetid, "snet-pub-1", null).id
    },
    lb-sub2 = {
      snetid = lookup(module.vpc.pub_snetid, "snet-pub-2", null).id
    }
  }
  sub-id-2 = {
    lb-sub3 = {
      snetid = lookup(module.vpc.pvt_snetid, "snet-pvt-1", null).id
    },
    lb-sub4 = {
      snetid = lookup(module.vpc.pvt_snetid, "snet-pvt-2", null).id
    }
  }
  action-type = var.action-type
  environment = var.environment
  stage       = var.stage
}
