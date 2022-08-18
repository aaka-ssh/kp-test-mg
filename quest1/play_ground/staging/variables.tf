# variable declarations

variable "region" {
  default = "us-central1"
  type    = string
}

variable "zone" {
  default = "us-central1-a"
  type    = string
}

variable "project_id" {
  default = "friendlychat-e3857"
  type    = string
}

variable "machine_type" {
  type = string
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
    "storage.googleapis.com",
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
