resource "google_compute_network" "vpc2" {
  name                    = var.vpcname
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
  project                 = "fsalaman-sandbox-340019"
}

resource "google_compute_subnetwork" "subnet1" {
  name          = var.subnet
  ip_cidr_range = "172.16.178.0/25"
  region        = "us-central1"
  project       = var.project
  network       = google_compute_network.vpc2.id
  secondary_ip_range {
    range_name    = "${var.subnet}-secondary-range"
    ip_cidr_range = "172.16.178.128/25"
  }
}

resource "google_compute_global_address" "private_ip_alloc_1" {
  name          = var.reserved1_name
  address       = var.reserved1_address
  purpose       = var.address_purpose
  address_type  = var.address_type
  prefix_length = var.reserved1_address_prefix_length
  network       = google_compute_network.vpc2.id
}

resource "google_compute_global_address" "private_ip_alloc_2" {
  name          = var.reserved2_name
  address       = var.reserved2_address
  purpose       = var.address_purpose
  address_type  = var.address_type
  prefix_length = var.reserved2_address_prefix_length
  network       = google_compute_network.vpc2.id
}

resource "google_service_networking_connection" "gcve-psa" {
  network                 = google_compute_network.vpc2.id
  service                 = var.service
  reserved_peering_ranges = [google_compute_global_address.private_ip_alloc_1.name, google_compute_global_address.private_ip_alloc_2.name]
  depends_on              = [google_compute_network.vpc2]
}

resource "google_compute_network_peering_routes_config" "peering_routes" {
  peering              = var.peering
  network              = google_compute_network.vpc2.name
  import_custom_routes = true
  export_custom_routes = true
  depends_on           = [google_service_networking_connection.gcve-psa]
}

// data "google_compute_network" "fabsvpc2" {
//   name    = "fabsvpc2"
//   project = "fsalaman-sanbox"
// }

