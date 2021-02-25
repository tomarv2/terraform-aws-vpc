module "vpc" {
  source                  = "../.."

  email                   = var.email
  teamid                  = var.teamid
  prjid                   = var.prjid
  profile_to_use          = var.profile_to_use
}