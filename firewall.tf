
resource "google_compute_firewall" "vpc2-fabsv2sn1-firewall" {
  name    = var.firewallname
  network = google_compute_network.vpc2.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "8080", "1000-8000"]
  }
  source_ranges = ["35.235.240.0/20", "172.16.0.0/16"]
  target_tags   = ["web", "linux"]
}