//TARGET GROUP 
variable "tg-name" {}

variable "tg-name-2" {}

variable "tg-port" {}

variable "tg-port-2" {}

variable tg_vpc {}


//APPLICATION LOAD BALANCER
variable "lb_name" {}

variable "internal" {}

variable "lb_name-2" {}

variable "internal-2" {}

variable "sg" {}

variable "sg2" {}

//LISTENER FOR ELB
variable "action-type" {}

variable "sub-id" {
  type = map
}

variable "sub-id-2" {
  type = map
}

variable "environment" {
  type = string
}

variable "stage" {
  type = string
}