# Create the CodeDeploy application
resource "aws_codedeploy_app" "my_app" {
  name = "my_app"
}

# Create the CodeDeploy deployment group
resource "aws_codedeploy_deployment_group" "my_deployment_group" {
  app_name = aws_codedeploy_app.my_app.name
  deployment_group_name = "my_deployment_group"
  service_role_arn = var.service_role_arn               
  autoscaling_groups = var.autoscaling_groups               //["nginx-asg"]//["${aws_autoscaling_group.autoscaling_group.name}"]

  deployment_style {
    deployment_type = "IN_PLACE"
    deployment_option = "WITH_TRAFFIC_CONTROL"
  }

#   trigger_configuration {
#     trigger_events = ["DeploymentStart"]
#     trigger_name = "my-trigger"
#   }

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }
}