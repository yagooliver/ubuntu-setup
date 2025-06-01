# === Install Visual Studio Code ===
if ! command -v code &> /dev/null; then
    echo "Installing Visual Studio Code..."

    # Import Microsoft GPG key
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

    # Add the VS Code repository
    sudo sh -c 'echo -e "[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

    # Install VS Code
    sudo dnf check-update
    sudo dnf install -y code
else
    echo "Visual Studio Code is already installed."
fi
