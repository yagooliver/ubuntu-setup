#!/bin/bash
set -e

echo "🔵 Installing Zsh + Oh-My-Zsh + Powerlevel10k + Nerd Font..."

# Install Zsh if missing
if ! command -v zsh &> /dev/null; then
    sudo apt install -y zsh
fi

# Install Oh-My-Zsh if missing
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true
fi

# Install Zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions || true
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting || true

# Update ~/.zshrc for plugins
sed -i 's/^plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc || true

# Install Powerlevel10k Theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k || true
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc || true

# Install Nerd Fonts (FiraCode)
if ! fc-list | grep -i "FiraCode Nerd Font" &> /dev/null; then
    echo "🔵 Installing FiraCode Nerd Font for Zsh UI..."
    sudo apt install -y fonts-firacode
else
    echo "✅ FiraCode Nerd Font already installed."
fi

echo "✅ Zsh environment fully configured!"

