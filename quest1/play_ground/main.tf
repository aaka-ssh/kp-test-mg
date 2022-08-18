module "service-enablement" {
  source           = "../modules/service-enablement"
  project          = var.project_id
  gcp_service_list = var.gcp_service_list
}

module "landingzone" {
  source        = "../modules/landingzone"
  project       = var.project_id
  location      = var.region
  primarycidr   = var.primarycidr
  secondarycidr = var.secondarycidr
  depends_on = [
    module.service-enablement
  ]
}

module "CE" {
  source     = "../modules/CE"
  zone       = var.zone
  machine_type = var.machine_type
  network    = module.landingzone.vpc_custom_network
  subnetwork = module.landingzone.network-with-private-secondary-ip-ranges

  depends_on = [
    module.service-enablement,
    module.landingzone
  ]
}

