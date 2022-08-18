variable "project" {
  type    = string
  default = "friendlychat-e3857"
}

variable "location" {
    type    = string 
}

variable "network_custom" {
  default = "custom2"
}

variable "custom_network_auto_create_subnetworks" {
  default = false
}

variable "custom_network_routing_mode" {
  default = "GLOBAL"
}

variable "custom_subnetwork" {
  default = "custom-subnetwork"
}

variable "region" {
  default = "us-central1"
}

variable "secondary_range_name" {
  default = "tf-test-secondary-range-update1"
}

variable "zone" {
  default = "us-central1-a"
  type    = string
}

variable "network" {
  default = "default"
  type    = string
}

variable "sub_network" {
  default = "default"
  type    = string
}

variable "machine_type" {
  default = "n1-standard-2"
  type    = string
}

variable "gcp_service_list" {
  type = list(string)
  default = [
    "file.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "billingbudgets.googleapis.com",
    "sourcerepo.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "bigquery.googleapis.com",
    "sqladmin.googleapis.com",
    "servicenetworking.googleapis.com"
  ]
}

variable "primarycidr" {
  type    = string
  default = "10.0.0.0/24"
}

variable "secondarycidr" {
  type    = string
  default = "10.2.0.0/24"
}
