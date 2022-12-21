module "vpc" {
  source           = "../modules/vpc"
  vpc_cidr         = var.vpc-cidr
  pub_snet_details = var.pub_snet_details
  pvt_snet_details = var.pvt_snet_details
  environment      = var.environment
  stage            = var.stage
}