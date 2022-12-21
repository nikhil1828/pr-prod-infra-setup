variable "region" {
  type = string
}

variable "vpc-cidr" {
  description = "Desired CIDR of VPC"
  type        = string
}
variable "pub_snet_details" {
  description = "Desired CIDR and Availability zone for public Subnet"
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
}

variable "pvt_snet_details" {
  description = "Desired CIDR and Availability zone for private Subnet"
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
}

variable "sg_details" {
  description = "Desired Security Group rules"
  type = map(object({
    name        = string
    description = string
    # vpc_id      = string
    ingress_rules = list(object({
      from_port       = number
      to_port         = number
      protocol        = string
      cidr_blocks     = list(string)
      security_groups = list(string)
    }))
  }))
}

# variable "ami_id" {
#   description = "Desired AMI's id for instances"
#   type        = string
#   validation {
#     condition = length(var.ami_id) == 21 && substr(var.ami_id, 0, 4) == "ami-"
#     # condition = can(regex("[a]?[m]?[i]?[-]?[a-z]*[0-9])",var.ami_id))
#     error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
#   }
# }


variable "action-type" {}

variable "lb_name" {}

variable "lb_name-2" {}

variable "internal" {}

variable "internal-2" {}

variable "tg-name" {}

variable "tg-name-2" {}

variable "tg-port" {}

variable "tg-port-2" {}

variable "environment" {
  type = string
}

variable "stage" {
  type = string
}



//LAUNCH CONFIGURATION
variable "lc_name" {}

variable "image_id" {}

variable "lc_name-2" {}

variable "image_id-2" {}

variable "instance_type" {
  description = "Desired instance type"
  type        = string
}

variable "key_name" {}


//AUTO SCALING
variable "asg_name" {}
variable "asg_name-2" {}

variable "min-size" {}

variable "max-size" {}

variable "desired_capacity" {}

variable "grace_period" {}

variable "hc_type" {}



variable "origin_id" {}