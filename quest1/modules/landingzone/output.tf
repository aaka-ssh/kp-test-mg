output "vpc_custom_network" {
  value = google_compute_network.vpc_custom_network.self_link
}

output "network-with-private-secondary-ip-ranges" {
  value = google_compute_subnetwork.network-with-private-secondary-ip-ranges.self_link
}