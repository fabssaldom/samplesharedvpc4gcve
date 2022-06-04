resource "google_compute_instance" "fabsgcvejumphost" {
  name         = var.vmname
  machine_type = "g1-small"
  zone         = var.zone
  project      = var.project

  tags = ["web", "linux"]

  boot_disk {
    initialize_params {
      image = "projects/${var.project}/global/images/${var.vmimage}"
    }
  }

  network_interface {
    network    = var.vpcname
    subnetwork = google_compute_subnetwork.subnet1.id
  }

  metadata = {
    name = var.vmname
  }

  metadata_startup_script = "sudo apt-get update && sudo apt-get -y upgrade"
}
