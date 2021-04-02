module "vpc" {
  source = "../"

  #------------------------------------------
  # Do not change the teamid, prjid once set.
  teamid = var.teamid
  prjid = var.prjid
}
