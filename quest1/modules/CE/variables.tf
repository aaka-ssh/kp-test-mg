variable "zone" {
  default = "us-central1-f"
}

variable "tags" {
  default = []
}

variable "network" {
  type = any
}

variable "subnetwork" {
  type = any
}

variable "machine_type" {
    type = string
  }