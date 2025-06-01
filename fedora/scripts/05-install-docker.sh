# === Install Docker ===
if ! command -v docker &> /dev/null; then
    echo "Installing Docker..."

    # Remove any old versions
    sudo dnf remove -y docker docker-client docker-client-latest docker-common docker-latest \
        docker-latest-logrotate docker-logrotate docker-engine

    # Add Docker CE repository
    sudo dnf -y install dnf-plugins-core
    sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

    # Install Docker CE and components
    sudo dnf install -y docker-cli docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    # Enable and start Docker
    sudo systemctl enable docker
    sudo systemctl start docker

    echo "Docker installation completed."
else
    echo "Docker is already installed."
fi

# === Allow Docker without sudo ===
if groups $USER | grep -q "\bdocker\b"; then
    echo "User '$USER' is already in the docker group."
else
    echo "Adding user '$USER' to docker group..."
    sudo usermod -aG docker $USER
    echo "✅ User added to docker group. Please log out and log back in to apply the change."
fi

# === Install Lazydocker ===
if ! command -v lazydocker &> /dev/null; then
    echo "Installing Lazydocker..."

    # Download latest release from GitHub
    LAZYDOCKER_LATEST=$(curl -s https://api.github.com/repos/jesseduffield/lazydocker/releases/latest \
        | grep "browser_download_url.*Linux_x86_64.tar.gz" \
        | cut -d '"' -f 4)

    curl -L "$LAZYDOCKER_LATEST" -o /tmp/lazydocker.tar.gz
    tar -xzf /tmp/lazydocker.tar.gz -C /tmp
    sudo mv /tmp/lazydocker /usr/local/bin/
    sudo chmod +x /usr/local/bin/lazydocker

    echo "Lazydocker installed successfully."
else
    echo "Lazydocker is already installed."
fi
