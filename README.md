# GCP Platform Engineering Assignment

This repository contains Terraform scripts, Ansible playbooks, and configurations for creating and managing a Linux instance in GCP (Google Cloud Platform). The project automates the setup of a virtual machine, services like MySQL and HTTP, and follows best practices for security, logging, and backups.

## Project Overview

This project involves setting up a GCP virtual machine and performing several tasks using Terraform and Ansible to manage the infrastructure and services. The setup includes the following:
- Virtual machine setup using Terraform
- MySQL and HTTP services configuration
- Automation using Ansible for web page deployment and service management
- Database creation and logging configuration
- Daily MySQL backups and log rotation
- SSL configuration with Let's Encrypt

## Infrastructure Details

### 1. Linux Instance Creation
- **Instance Type:** e2-medium (f1-micro does'nt have enough resource to run services and command of intrest)
- **OS:** CentOS 7
- **Zone:** europe-north1-c (There are no resource available in europe-west3-a)
- **Public IP:** Dynamic public IP assigned by GCP is `34.88.120.243`
- **Private IP:** Dynamic private IP assigned in the default network is `10.11.0.5`.
- **Startup Script:** The instance is initialized with a startup script to update system packages and install HTTP services.
- **Firewall Tag:** 
  - Tag: `allow-access`
  - Rules: Allow access to HTTP (80) (port 80 is needed for renew ssl certificate) HTTPS (443) and SSH (2233) ports.
  - The firewall tag is attached to the instance for public access.

### 2. SSH Key Setup
- **SSH Keys:** Added to the GCP project for secure access to the virtual machine.
- **Instance Access:** Verified by logging into the VM and ensuring httpd service is installed, running, and enabled on boot.

### 3. MySQL and HTTP Service Setup
- **MySQL Setup:**
  - Installed and running on the virtual machine.
  - Database created: `exam`
  - Table created: `vminfo` with the required structure:

### 4. Ansible Automation
- **Ansible Inventory:** The inventory file includes the virtual machine’s public IP and name.
- **Ansible Role:** A role is created to deploy a simple web page containing your name and some other information.
- **Tasks:**
  - Template an HTML file.
  - Upload the HTML file to the VM.
  - Restart the httpd service after the web page is uploaded.
  
### 5. Backup and Log Rotation
- **Backup:** 
  - A daily cron job is scheduled at 23:59 to back up the MySQL database (`exam`) automatically.
  - The backups are stored in a `/usr/local/bin/mysql_backup` directory on the virtual machine.
- **Log Rotation:**
  - HTTP and MySQL logs are rotated daily and configured to keep logs for up to 7 days.

### 6. Domain and SSL Configuration
- **Domain Name:** A free domain is created using [Duckdns] (no-ip.com just provide one free domain which I have used it for azure project)(https://www.duckdns.org/) with the `duckdns.org` domain. https://majid-gcp.duckdns.org
- **SSL Certificate:**
  - Generated using Let's Encrypt.
  - Configured HTTP to use the SSL certificate for secure connections.
  
### 7. Repositories
- Since Google Cloud Source Repository no longer available for new users I pushed project codes to this Azure DevOps Repository https://dev.azure.com/moslehkormaji/assignment-gcp.

