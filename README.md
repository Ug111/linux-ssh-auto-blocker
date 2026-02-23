#!/bin/bash

# ==================================================
# SSH Auto Blocker - Intrusion Prevention Script
# Author: Ug111
# Description:
# Monitors SSH authentication logs and automatically
# blocks IP addresses that exceed failed login threshold.
# Environment: Ubuntu Linux
# ==================================================

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

## Detection Logic 
The script monitors 'var/log/auth.log' and counts repeated 

## 🚀 How to Use
 Clone the repo:
   ```bash
   git clone https://github.com/Ug111/linux-ssh-auto-blocker.git
   cd linux-ssh-auto-blockerailed SSH login attempts from the same IP address.

if an IP exceeds a predefined threshold (e.g., 5 failed attempts), the script automatically blocks the IP using UFW firewall rules.

## Example Detection Output
[2026-02-22 04:10:11] BLOCKED: 192.168.1.100 - 21 failed attempts

Firewall Rule Applied
DROP tcp -- 192.168.1.100 0.0.0.0/0 tcp dpt:22

## Limitations 
- Designed for Ubuntu-based systems
- Requires UFW or iptables enabled
- Intended for educational and lab environments

Author: Ug111
