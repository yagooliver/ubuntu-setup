# === Install Virtualization Tools ===
echo "Installing Virtualization Tools..."
sudo dnf install -y @virtualization virt-manager qemu-kvm libvirt bridge-utils

# Enable and start libvirtd
sudo systemctl enable --now libvirtd

# Add current user to libvirt group (optional, for non-root access)
sudo usermod -aG libvirt $(whoami)

# === Install Timeshift ===
echo "Installing Timeshift..."
sudo dnf install -y timeshift