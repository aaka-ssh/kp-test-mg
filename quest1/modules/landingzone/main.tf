module "bucket" {
  source  = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
  version = "~> 1.3"

 

  name       = "${var.project}-bucket1"
  project_id = var.project
  location   = var.location
}
# Network - custom
resource "google_compute_network" "vpc_custom_network" {
  name                    = var.network_custom
  auto_create_subnetworks = var.custom_network_auto_create_subnetworks
  project                 = var.project
  routing_mode            = var.custom_network_routing_mode
}

# Subnet - custom
resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
  name          = var.custom_subnetwork
  ip_cidr_range = var.primarycidr
  region        = var.region
  project       = var.project
  network       = google_compute_network.vpc_custom_network.id
  secondary_ip_range {
    range_name    = var.secondary_range_name
    ip_cidr_range = var.secondarycidr
  }
}

resource "google_compute_global_address" "custom_ip_address" {
  provider = google-beta

  name          = "custom-ip-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.vpc_custom_network.id
}

resource "google_service_networking_connection" "custom_vpc_connection" {
  provider = google-beta

  network                 = google_compute_network.vpc_custom_network.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.custom_ip_address.name]
}

resource "random_id" "db_name_suffix" {
  byte_length = 4
}

resource "google_sql_database_instance" "instance" {
  #project = var.project_id

  name             = "private-instance-${random_id.db_name_suffix.hex}"
  region           = "us-central1"
  database_version = "MYSQL_5_7"

 depends_on = [google_service_networking_connection.custom_vpc_connection]

  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.vpc_custom_network.id
    }
  }
}

resource "google_sql_database" "database" {
  name     = "kp_test"
  instance = google_sql_database_instance.instance.name
}

resource "google_sql_user" "users" {
  name     = "kp_test"
  instance = google_sql_database_instance.instance.name
  password = "verysecure"
}
