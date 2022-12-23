module "deploy" {
  source = "../modules/codedeploy"
  service_role_arn = module.iam.codepeloy-role-arn
  autoscaling_groups = [module.asg.asg-name]
}
