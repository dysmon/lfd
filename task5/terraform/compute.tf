resource "google_compute_instance" "vm" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone


  boot_disk {
    initialize_params {
      image = "${var.image_project}/${var.image_family}"
      size  = 20
      type  = "pd-balanced"
    }
  }


  network_interface {
    network    = google_compute_network.vpc.self_link
    subnetwork = google_compute_subnetwork.subnet.self_link


    access_config {
      # Ephemeral public IP
    }
  }


  metadata = {
    # Add SSH key in the form: "username:ssh-rsa AAA..."
    ssh-keys = "${var.ssh_user}:${var.ssh_public_key}"
  }


  tags = ["http-server", "https-server"]
}
