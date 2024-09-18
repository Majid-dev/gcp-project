data "google_compute_subnetwork" "my-subnetwork" {
  name   = "default"
  region = var.region
}

resource "google_compute_instance" "centos_vm" {
  name                      = var.instance-name
  allow_stopping_for_update = true
  machine_type              = var.machine_type

  boot_disk {
    initialize_params {
      image = var.disk-image
      size  = var.disk-size
    }
  }

  network_interface {
    subnetwork = data.google_compute_subnetwork.my-subnetwork.name
    access_config {}
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo yum -y update
    sudo yum -y install httpd
    sudo systemctl enable httpd
    sudo systemctl start httpd
  EOT

  tags = [tolist(google_compute_firewall.allow_https_ssh.target_tags)[0]]

  metadata = {
    ssh-keys = "moslehkormaji:${file("sensitive-data/ecdsa_key.pem.pub")}"
  }

  service_account {
    scopes = var.service-account-scopes
  }
}

resource "google_compute_firewall" "allow_https_ssh" {
  name      = "allow-access"
  direction = "INGRESS"
  network   = data.google_compute_subnetwork.my-subnetwork.network

  allow {
    protocol = "tcp"
    ports    = var.firewall-ports
  }

  priority      = 1000
  target_tags   = var.firewall-target-tags
  source_ranges = var.firewall-source-ranges
}
