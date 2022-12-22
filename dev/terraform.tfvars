region = "ap-south-1"

vpc-cidr = "10.0.0.0/16"

pub_snet_details = {
  snet-pub-1 = {
    cidr_block        = "10.0.0.0/18",
    availability_zone = "ap-south-1a"
  },
  snet-pub-2 = {
    cidr_block        = "10.0.64.0/18",
    availability_zone = "ap-south-1b"
  }
}

pvt_snet_details = {
  snet-pvt-1 = {
    cidr_block        = "10.0.128.0/18",
    availability_zone = "ap-south-1a"
  },
  snet-pvt-2 = {
    cidr_block        = "10.0.192.0/18",
    availability_zone = "ap-south-1b"
  }
}

sg_details = {
  "ec2-sg" = {
    name        = "ec2-sg"
    description = "SG for public LB"
    ingress_rules = [
      {
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
        security_groups = null
    }]
  }
}


tg-name     = "ec2-tg1-grp-nginx"
tg-name-2   = "ec2-tg2-grp-tomcat"
tg-port     = 80
tg-port-2   = 8080
lb_name     = "pub-ealb-nginx"
lb_name-2   = "pvt-ealb-tomcat"
internal    = false
internal-2  = true
action-type = "forward"


lc_name          = "nginx_config"
lc_name-2        = "tomcat_config"
image_id         = "ami-014018e5f3546dae8" //nginx-image
image_id-2       = "ami-0c9a52690acf91d95" //tomcat-image
instance_type    = "t2.micro"
key_name         = "mumbai-key"
asg_name         = "nginx-asg"
asg_name-2       = "tomcat-asg"
min-size         = 1
max-size         = 3
desired_capacity = 1
grace_period     = 300
hc_type          = "ELB"

environment = "networking"
stage       = "UAT"


origin_id = "content delivery network for Application load balancer"