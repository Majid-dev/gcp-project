
project                = "delta-env-435719-b1"
zone                   = "europe-north1-c"
instance-name          = "centos-7-instance"
region                 = "europe-north1"
machine_type           = "e2-medium"
disk-image             = "centos-stream-9-v20240815"
disk-size              = "20"
service-account-scopes = ["https://www.googleapis.com/auth/cloud-platform"]
firewall-ports         = ["2233", "80", "443"]
firewall-target-tags   = ["allow-access"]
firewall-source-ranges = ["0.0.0.0/0"]