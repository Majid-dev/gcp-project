output "instance_name" {
  value = google_compute_instance.centos_vm.name
}

output "instance_public_ip" {
  value = google_compute_instance.centos_vm.network_interface[0].access_config[0].nat_ip
}