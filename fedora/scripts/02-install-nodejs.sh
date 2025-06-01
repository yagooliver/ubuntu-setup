# === Install Latest Node.js ===
echo "Adding NodeSource repo for latest Node.js..."
curl -fsSL https://rpm.nodesource.com/setup_current.x | sudo bash -
sudo dnf install -y nodejs

# === Verify Node.js version ===
echo "Installed Node.js version:"
node -v

# === Install Yarn globally ===
echo "Installing Yarn globally..."
sudo npm install --global yarn

# === Verify Yarn version ===
echo "Installed Yarn version:"
yarn -v

# === Install NestJS CLI ===
echo "Installing NestJS CLI globally..."
sudo npm install --global @nestjs/cli

# === Verify NestJS CLI ===
echo "Installed NestJS CLI version:"
nest --version

# === (Optional) Create a new NestJS project ===
# echo "Creating a new NestJS project in 'my-nest-app'..."
# nest new my-nest-app --package-manager yarn