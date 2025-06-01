# === Install JetBrains Toolbox ===
if [ ! -d "/opt/jetbrains-toolbox" ]; then
    echo "Installing JetBrains Toolbox..."
    TOOLBOX_URL=$(curl -s "https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release" | jq -r '.TBA[0].downloads.linux.link')
    mkdir -p /opt/jetbrains-toolbox
    curl -L "$TOOLBOX_URL" -o /tmp/jetbrains-toolbox.tar.gz
    tar -xzf /tmp/jetbrains-toolbox.tar.gz -C /opt/jetbrains-toolbox --strip-components=1
    chmod +x /opt/jetbrains-toolbox/jetbrains-toolbox
    /opt/jetbrains-toolbox/jetbrains-toolbox &
fi
