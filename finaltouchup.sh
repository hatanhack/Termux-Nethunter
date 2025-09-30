#!/usr/bin/env bash -e

# Copyright ©2024 by HatanHack. All rights reserved.
# Website: https://hatanhack.com
################################################################################
# This script runs INSIDE the Kali Chroot to perform final setup,
# including creating the 'kali' user, setting the password, and updating the system.
################################################################################

DESTINATION=${DESTINATION}
SETARCH=${SETARCH}
unset DESTINATION
unset SETARCH

# Colors
red='\033[1;31m'
yellow='\033[1;33m'
blue='\033[1;34m'
reset='\033[0m'

printf "\n${blue} [*] Running final configuration steps inside Kali environment..."
printf "${reset}\n"

# 1. Update and Upgrade Kali
printf "\n${yellow} [*] Updating Kali package list and upgrading packages..."
apt update
apt upgrade -y

# 2. Set default environment and hostname
printf "\n${yellow} [*] Setting up environment variables..."
export LANG=C.UTF-8
export DEBIAN_FRONTEND=noninteractive
echo "kali" > /etc/hostname
echo "127.0.0.1       localhost kali" >> /etc/hosts
echo "kali" > /etc/chroot-name

# 3. Add the default 'kali' user
printf "\n${yellow} [*] Creating default user 'kali'..."
adduser --disabled-password --gecos "" kali

# 4. Set default password (default is 'kali')
# This is a common practice in NetHunter/Kali setups.
printf "\n${yellow} [*] Setting password for user 'kali' to 'kali' (default)..."
echo "kali:kali" | chpasswd

# 5. Add 'kali' user to sudo group
printf "\n${yellow} [*] Adding 'kali' user to sudo group..."
usermod -aG sudo kali

# 6. Install common utilities (optional but recommended)
printf "\n${yellow} [*] Installing essential tools: nano, wget, curl, net-tools, gnupg..."
apt install -y nano wget curl net-tools gnupg

# 7. Clean up the apt cache
printf "\n${yellow} [*] Cleaning up package cache..."
apt autoremove -y
apt clean

# 8. Set ownership for the 'kali' home directory
chown -R kali:kali /home/kali

printf "\n${blue} [SUCCESS] Kali Nethunter setup is complete!"
printf "\n Now type 'startkali.sh' to login."
printf "${reset}\n"

# Exit the chroot environment cleanly
exit 0
