# === Update System ===
echo "🔵 Updating system packages..."
sudo apt update && sudo apt upgrade -y

# === Install Essentials ===
echo "🔵 Installing base essentials..."
sudo apt install -y curl wget gpg vim git ca-certificates software-properties-common lsb-release apt-transport-https build-essential jq make cmake pkg-config zsh tmux htop ncdu bat ripgrep fd-find fuse libfuse2 gnupg python3 python3-pip
