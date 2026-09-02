#!/bin/bash

# Kali Linux Dependency Installation Script
# Exit on any error
set -e

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Check if script is run as root
if [ "$EUID" -ne 0 ]; then
  echo -e "${RED}[-] Please run this script with sudo or as root.${NC}"
  exit 1
fi

echo -e "${GREEN}[+] Updating package lists...${NC}"
apt update || { echo -e "${RED}[-] Failed to update packages${NC}"; exit 1; }

# List of packages to install
packages=(
  aircrack-ng
  iproute2
  pciutils
  procps
  xterm
  ettercap-common
  dnsmasq
  bully
  nftables
  pixiewps
  hashcat
  tcpdump
  tshark
  reaver
  john
  crunch
  openssl
  bettercap
  hcxtools
  isc-dhcp-server
  asleap
  hostapd
  mdk4
  hcxdumptool
  beef-xss
  curl
)

echo -e "${GREEN}[+] Installing tools...${NC}"
failed_packages=()

for pkg in "${packages[@]}"; do
  echo -e "${YELLOW}[*] Installing: $pkg${NC}"
  if ! apt install -y "$pkg" 2>&1; then
    echo -e "${RED}[-] Failed to install: $pkg${NC}"
    failed_packages+=("$pkg")
  fi
done

echo ""
echo -e "${GREEN}[+] Installation process completed!${NC}"

# Report failed installations
if [ ${#failed_packages[@]} -ne 0 ]; then
  echo -e "${YELLOW}[!] The following packages failed to install:${NC}"
  printf '%s\n' "${failed_packages[@]}" | sed 's/^/    - /'
  echo -e "${YELLOW}[!] These packages may not be available in your Kali repositories.${NC}"
  echo -e "${YELLOW}[!] Try installing them manually or check if they require special repositories.${NC}"
else
  echo -e "${GREEN}[+] All dependencies installed successfully!${NC}"
fi
