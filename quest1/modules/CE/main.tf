locals {
  master_os_image = "centos-cloud/centos-7"
}

resource "google_compute_instance" "compu_instance" {
  count        = 2
  name         = "${var.machine_type}-${count.index}"
  machine_type = var.machine_type #"n2-standard-2"
  zone         = var.zone

  tags = var.tags

  boot_disk {
    initialize_params {
      image = local.master_os_image

    }
  }
  scratch_disk {
    interface = "NVME" 
  }
  metadata = {
    enable-oslogin = "TRUE"
  }

  network_interface {
    network = var.network
    subnetwork = var.subnetwork
    access_config {} # Ephemeral IP
    
  }

}