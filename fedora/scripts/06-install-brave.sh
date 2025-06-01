# === Install Brave Browser ===
if ! command -v brave-browser &> /dev/null; then
    echo "Installing Brave Browser..."

    # Add Brave's official repository
    sudo dnf install -y dnf-plugins-core
    sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

    # Import Brave's GPG key
    sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

    # Install Brave Browser
    sudo dnf install -y brave-browser

    echo "Brave Browser installation completed."
else
    echo "Brave Browser is already installed."
fi