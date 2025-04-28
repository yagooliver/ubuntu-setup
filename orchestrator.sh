#!/bin/bash

set -e

echo "Starting Full Ubuntu Pro Setup Orchestration..."

# === Modular Install Scripts ===
declare -a scripts=(
  "./scripts/00-install-essentials.sh"
  "./scripts/01-install-zsh.sh"
  "./scripts/02-install-nodejs.sh"
  "./scripts/03-install-vscode.sh"
  "./scripts/04-install-jetbrainstools.sh"
  "./scripts/05-install-docker.sh"
  "./scripts/06-install-brave.sh"
  "./scripts/07-install-ollama.sh"
  "./scripts/08-install-virtualization.sh"
  "./scripts/09-install-neovim.sh"
)

for script in "${scripts[@]}"; do
  if [ -f "./$script" ]; then
    echo "🛠️ Running $script..."
    bash "./$script"
    echo "✅ $script completed."
  else
    echo "⚠️ Warning: $script not found, skipping."
  fi
done

# === Finish ===
echo ""
echo -e "\e[32m✅ Full system setup complete! 🎯 Please reboot to finalize changes!\e[0m"

