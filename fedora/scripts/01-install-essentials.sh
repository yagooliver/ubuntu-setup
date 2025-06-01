# === Update System ===
echo "Updating system packages..."
sudo dnf upgrade --refresh -y

# === Install Essentials ===
echo "Installing base essentials..."
sudo dnf install -y \
  curl wget gnupg2 vim git ca-certificates \
  dnf-plugins-core lsb_release \
  make cmake gcc-c++ \
  zsh tmux htop ncdu \
  bat ripgrep fd-find \
  fuse fuse3 \
  python3 python3-pip jq pkgconf-pkg-config