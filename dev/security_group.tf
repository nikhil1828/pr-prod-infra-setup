module "sg" {
  source      = "../modules/sg"
  vpc_id      = module.vpc.vpc_id
  sg_details  = var.sg_details
  environment = var.environment
  stage       = var.stage
}


module "sg2" {
  source = "../modules/sg"
  vpc_id = module.vpc.vpc_id
  sg_details = {
    "ec2-sg2" = {
      name        = "ec2-sg2"
      description = "SG for NGINX ASG"
      ingress_rules = [
        {
          from_port       = 22
          to_port         = 22
          protocol        = "tcp"
          cidr_blocks     = ["0.0.0.0/0"]
          security_groups = null
        },
        {
          from_port       = 80
          to_port         = 80
          protocol        = "tcp"
          cidr_blocks     = null
          security_groups = [lookup(module.sg.sg_id, "ec2-sg", null)]
      }]
  } }
  environment = var.environment
  stage       = var.stage
}


module "sg3" {
  source = "../modules/sg"
  vpc_id = module.vpc.vpc_id
  sg_details = {
    "ec2-sg3" = {
      name        = "ec2-sg3"
      description = "SG for private LB"
      ingress_rules = [
        {
          from_port       = 80
          to_port         = 80
          protocol        = "tcp"
          cidr_blocks     = null
          security_groups = [lookup(module.sg2.sg_id, "ec2-sg2", null)]
      }]
  } }
  environment = var.environment
  stage       = var.stage
}


module "sg4" {
  source = "../modules/sg"
  vpc_id = module.vpc.vpc_id
  sg_details = {
    "ec2-sg4" = {
      name        = "ec2-sg4"
      description = "SG for TOMCAT ASG"
      ingress_rules = [
        {
          from_port       = 22
          to_port         = 22
          protocol        = "tcp"
          cidr_blocks     = null
          security_groups = [lookup(module.sg2.sg_id, "ec2-sg2", null)]
        },
        {
          from_port       = 8080
          to_port         = 8080
          protocol        = "tcp"
          cidr_blocks     = null
          security_groups = [lookup(module.sg3.sg_id, "ec2-sg3", null)]
      }]
  } }
  environment = var.environment
  stage       = var.stage
}
