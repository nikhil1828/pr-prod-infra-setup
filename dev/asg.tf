module "asg" {
  source           = "../modules/asg"
  lc_name          = var.lc_name
  image_id         = var.image_id
  instance_type    = var.instance_type
  key_name         = var.key_name
  sg               = [lookup(module.sg2.sg_id, "ec2-sg2", null)]
  asg_name         = var.asg_name
  min-size         = var.min-size
  max-size         = var.max-size
  desired_capacity = var.desired_capacity
  user_data        = null
  snet             = [lookup(module.vpc.pub_snetid, "snet-pub-1", null).id, lookup(module.vpc.pub_snetid, "snet-pub-2", null).id]
  tg-arn           = module.lb.tg-arn
  grace_period     = var.grace_period
  hc_type          = var.hc_type
}

module "asg2" {
  source = "../modules/asg"
  lc_name = var.lc_name-2
  image_id = var.image_id-2
  instance_type = var.instance_type
  key_name = var.key_name
  sg = [lookup(module.sg4.sg_id,"ec2-sg4",null)]
  asg_name = var.asg_name-2
  min-size = var.min-size
  max-size = var.max-size
  desired_capacity = var.desired_capacity
  user_data = <<-EOF
  #!/bin/bash
  /opt/apache-tomcat-8.5.84/bin/startup.sh
  sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
  
  EOF
  snet = [lookup(module.vpc.pvt_snetid,"snet-pvt-1",null).id, lookup(module.vpc.pvt_snetid,"snet-pvt-2",null).id]
  tg-arn = module.lb.tg2-arn
  grace_period = var.grace_period
  hc_type = var.hc_type
}