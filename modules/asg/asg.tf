resource "aws_launch_configuration" "as_conf" {
  name_prefix          = var.lc_name
  image_id             = var.image_id
  instance_type        = var.instance_type
  key_name             = var.key_name
  security_groups      = var.sg
  user_data            = var.user_data
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "bar" {
  name_prefix               = var.asg_name
  launch_configuration      = aws_launch_configuration.as_conf.name
  min_size                  = var.min-size
  desired_capacity          = var.desired_capacity
  max_size                  = var.max-size
  vpc_zone_identifier       = var.snet
  target_group_arns         = [var.tg-arn]
  health_check_grace_period = var.grace_period
  health_check_type         = var.hc_type
  
  lifecycle {
    create_before_destroy = true
  }
}


# resource "aws_autoscaling_group" "bar2" {
#   name_prefix          = var.asg_name2
#   launch_configuration = aws_launch_configuration.as_conf.name
#   min_size             = var.min-size
#   desired_capacity     = var.desired_capacity
#   max_size             = var.max-size
#   vpc_zone_identifier = [for k in var.snet2: k.snetid]
#   target_group_arns = [var.tg2-arn]
#   health_check_grace_period = var.grace_period
#   health_check_type         = var.hc_type
  
#   lifecycle {
#     create_before_destroy = true
#   }
# }


# resource "aws_launch_template" "foo" {
#   name = "foo"

#   block_device_mappings {
#     device_name = "/dev/sda1"

#     ebs {
#       volume_size = 20
#     }
#   }

#   capacity_reservation_specification {
#     capacity_reservation_preference = "open"
#   }

#   cpu_options {
#     core_count       = 4
#     threads_per_core = 2
#   }

#   credit_specification {
#     cpu_credits = "standard"
#   }

#   disable_api_stop        = true
#   disable_api_termination = true

#   ebs_optimized = true

#   elastic_gpu_specifications {
#     type = "test"
#   }

#   elastic_inference_accelerator {
#     type = "eia1.medium"
#   }

#   iam_instance_profile {
#     name = "test"
#   }

#   image_id = var.image_id

#   instance_initiated_shutdown_behavior = "terminate"

#   instance_market_options {
#     market_type = "spot"
#   }

#   instance_type = var.instance_type

#   kernel_id = "test"

#   key_name = "test"

#   license_specification {
#     license_configuration_arn = "arn:aws:license-manager:eu-west-1:123456789012:license-configuration:lic-0123456789abcdef0123456789abcdef"
#   }



#   network_interfaces {
#     associate_public_ip_address = true
#   }

#   placement {
#     availability_zone = "us-west-2a"
#   }

#   ram_disk_id = "test"

#   vpc_security_group_ids = ["sg-12345678"]

#   tag_specifications {
#     resource_type = "instance"

#     tags = {
#       Name = "test"
#     }
#   }

#   user_data = filebase64("${path.module}/example.sh")
# }