# === Install Virtualization tools ===
echo "Installing Virtualization Tools..."
apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager
systemctl enable libvirtd
systemctl start libvirtd

# === Install Timeshift ===
apt install -y timeshift
