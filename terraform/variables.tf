variable "project" {}
variable "zone" {}
variable "region" {}
variable "instance-name" {}
variable "machine_type" {}
variable "disk-image" {}
variable "disk-size" {}
variable "service-account-scopes" { type = list(string) }
variable "firewall-ports" { type = list(string) }
variable "firewall-target-tags" { type = list(string) }
variable "firewall-source-ranges" { type = list(string) }