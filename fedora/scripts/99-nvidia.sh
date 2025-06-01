#!/bin/bash
set -e

echo "Installing NVIDIA drivers and setting up PRIME GPU switching..."

# === Add RPM Fusion (for proprietary drivers) ===
sudo dnf install -y \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# === Update DNF metadata ===
sudo dnf update -y

# === Install NVIDIA driver and tools ===
sudo dnf install -y akmod-nvidia xorg-x11-drv-nvidia-cuda

# === Install Optimus manager ===
sudo dnf install -y xorg-x11-drv-nvidia-power

# === Reboot Notice ===
echo ""
echo "✅ NVIDIA drivers installed. Please reboot your system to load the driver."
echo ""

# === PRIME GPU Switching ===
echo "Installing NVIDIA PRIME GPU switching utilities..."

# Enable switching via CLI
sudo dnf install -y switcheroo-control

# Enable switcheroo-control (for integrated/discrete switch support)
sudo systemctl enable switcheroo-control
sudo systemctl start switcheroo-control

echo ""
echo "To switch GPUs, use:"
echo "  echo 'on' | sudo tee /sys/bus/pci/devices/0000:01:00.0/power/control"
echo "Or set PRIME profiles via NVIDIA settings or GNOME Settings > Power"
echo ""

# (Optional) GUI utility for switching (GNOME only)
if command -v gnome-shell &> /dev/null; then
    echo "You may also use GNOME Control Center to switch GPUs (if supported)."
fi