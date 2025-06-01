# === Install NodeJS (via NVM) ===
if ! command -v nvm &> /dev/null; then
    echo "Installing NVM + Node.js LTS..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    nvm install --lts
    nvm use --lts
fi

# === Install Yarn globally ===
npm install --global yarn
