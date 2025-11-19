resource "google_compute_network" "vpc" {
  name                    = "tf-vpc"
  auto_create_subnetworks = false
}


resource "google_compute_subnetwork" "subnet" {
  name          = "tf-subnet"
  ip_cidr_range = "10.0.0.0/24"
  region        = var.region
  network       = google_compute_network.vpc.id
}

resource "google_compute_firewall" "multi_port" {
  for_each = { for p in var.firewall_allowed_ports : p.name => p }

  name    = "allow-${each.value.name}"
  network = google_compute_network.vpc.self_link

  allow {
    protocol = each.value.proto
    ports    = [each.value.port]
  }

  # For testing: allow all IPs
  source_ranges = ["0.0.0.0/0"]

  # Optional: assign target tag to apply firewall to specific VM(s)
  # target_tags = ["web"]
}
