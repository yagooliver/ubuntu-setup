# === Install JetBrains Toolbox ===
if [ ! -d "/opt/jetbrains-toolbox" ]; then
    echo "Installing JetBrains Toolbox..."

    # Ensure required tools are installed
    sudo dnf install -y curl jq tar

    # Fetch the latest Toolbox URL from JetBrains API
    TOOLBOX_URL=$(curl -s "https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release" | jq -r '.TBA[0].downloads.linux.link')

    # Download and extract
    sudo mkdir -p /opt/jetbrains-toolbox
    curl -L "$TOOLBOX_URL" -o /tmp/jetbrains-toolbox.tar.gz
    sudo tar -xzf /tmp/jetbrains-toolbox.tar.gz -C /opt/jetbrains-toolbox --strip-components=1

    # Set permissions and launch
    sudo chmod +x /opt/jetbrains-toolbox/jetbrains-toolbox
    /opt/jetbrains-toolbox/jetbrains-toolbox &
else
    echo "JetBrains Toolbox already installed."
fi