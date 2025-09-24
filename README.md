# GCP Infrastructure and Application Deployment

<hr>

## 📝 Overview

This project demonstrates a comprehensive **Infrastructure as Code (IaC)** and configuration management pipeline on **Google Cloud Platform (GCP)**. It leverages **Terraform** to provision a secure Linux virtual machine and **Ansible** to configure it, install software, and deploy a simple web application. The solution focuses on production-level best practices, including automation, security hardening, and data management.

<hr>

## 🚀 Key Features

* **Infrastructure as Code (IaC)**: Deploys a CentOS 7 virtual machine with dynamic IP addresses and a secure firewall using **Terraform**.
* **Automated Provisioning**: The virtual machine is configured at boot with a startup script to update packages and services.
* **Configuration Management**: An **Ansible** playbook and roles are used to automate the entire configuration process, from installing services to deploying the web page and managing security.
* **Comprehensive System Hardening**: The Ansible playbook includes a dedicated role for hardening the operating system. This automates tasks such as enforcing strong password policies, securing SSH by changing the default port and disabling password authentication, configuring a strict firewall, and setting up an Intrusion Detection System (IDS) for file integrity monitoring.
* **Automated Database Management**: A **MySQL** database is installed, configured, automatically backed up daily, and its logs are rotated.
* **SSL/TLS Security**: A free SSL certificate from **Let's Encrypt** is generated and configured to secure the web application with HTTPS.

<hr>

## ⚙️ Technologies Used

| Category | Technology |
| :--- | :--- |
| **Cloud Provider** | Google Cloud Platform (GCP) |
| **IaC** | Terraform |
| **Configuration Management** | Ansible |
| **Operating System** | CentOS 7 |
| **Web Server** | HTTPD |
| **Database** | MySQL |
| **Certificate Authority** | Let's Encrypt |

<hr>

## 🔧 Prerequisites

* An **Azure** account with an active subscription.
* **Terraform** installed locally.
* **Azure CLI** installed and configured.
* **Kubectl** installed.
* **Helm** installed.
* **Docker** installed.
* A **DDNS** domain name (e.g., from No-IP or a public suffix list).

## 🚀 How to Run

### Step 1: Terraform Deployment

1.  Navigate to the `terraform` directory.
2.  Initialize Terraform: `terraform init`.
3.  Review the plan: `terraform plan`.
4.  Apply the configuration to create the Azure resources: `terraform apply`.

### Step 2: Ansible Configuration
1. Navigate to the ansible directory.
2. Update the inventory.ini file with the public IP address and name of the virtual machine.
3. Execute the main Ansible playbook to configure the VM with all roles:

`ansible-playbook -i inventory.ini playbook.yaml`