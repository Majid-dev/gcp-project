# CentOS Hardening Report

## Overview

This document describes the steps taken to harden a CentOS operating system, making it more secure for production environments. The process includes applying system updates, configuring firewalls, managing users and passwords, securing SSH, and more. This guide follows industry best practices for server hardening.

## Hardening Steps

### 1. System Updates

Ensure the system is up to date with the latest security patches:

```bash
sudo yum check-update
sudo yum update -y
```
### 2. User and Group Management
- Removed unnecessary user accounts.
- Enforced strong password policies by editing /etc/login.defs and /etc/security/pwquality.conf to ensure complex passwords, password expiration, and reuse prevention.

```bash
sudo nano /etc/security/pwquality.conf
sudo nano /etc/login.defs
```
### 3. SSH Configuration
- Changed the SSH port from default 22 to 2233
- Disabled password authentication in favor of key-based authentication
- Disabled root login
```bash
sudo nano /etc/ssh/sshd_config
```
### 4. Firewall Configuration (Firewalld)
- Allowed only necessary services like HTTP, HTTPS, and SSH on specific ports:
```bash
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --permanent --add-port=2233/tcp
sudo firewall-cmd --reload
```
### 5. Security Updates
- Configured dnf-automatic to automatically apply security updates:
```bash
sudo nano /etc/dnf/automatic.conf
```
- Set apply_updates = yes to ensure updates are automatically applied.
### 6. Intrusion Detection System (IDS)
- Installed AIDE for file integrity monitoring:
```bash
sudo yum install aide -y
sudo aide --init
sudo cp /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz
sudo aide --check
```
Scheduled a daily integrity check using cron:
```bash
sudo crontab -e
```
Add:
```bash
0 3 * * * /usr/sbin/aide --check
```
