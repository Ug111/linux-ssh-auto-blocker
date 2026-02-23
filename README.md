# Linux SSH Auto Blocker (Intrusion Prevention System)

## Overview
This project is a lightweight intrusion detection and prevention script designed to monitor SSH authentication logs and automatically block brute-force attackers using firewall rules.

## Features
- Real-time SSH log monitoring
- Detects multiple failed login attempts
- Automatically blocks malicious IP addresses
- Generates security report logs
- Cron-based automated execution

## Technologies Used
- Bash (Shell Scripting)
- Linux (Ubuntu/Kali)
- UFW / iptables
- Cron Jobs

## Project Structure
linux-ssh-auto-blocker/
│
├── screenshots/
├── ssh_auto_blocker.sh
├── README.md

## How It Works
The script parses authentication logs (/var/log/auth.log), identifies repeated failed SSH login attempts from the same IP address, and applies firewall rules to block those IPs automatically.

## Use Case
This project demonstrates practical SOC-level defensive security skills including log analysis, threat detection, and automated response.

---

Author: Ug111
