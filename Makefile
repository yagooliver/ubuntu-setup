# =====================================
# Ubuntu Full Developer Setup - Makefile
# =====================================

# Variables
SCRIPTS_DIR := ./scripts

# Default target
all: install

# Install everything
install:
	@echo "Running Full System Setup..."
	@bash ./orchestrator.sh

# Update System only
update:
	@echo "Updating system packages..."
	@sudo apt update && sudo apt upgrade -y

# Essentials manually (optional if you split essentials install)
essentials:
	@echo "🔧 Installing essential tools..."
	@sudo apt install -y curl wget gpg vim git ca-certificates software-properties-common lsb-release apt-transport-https build-essential jq make cmake pkg-config zsh tmux htop ncdu bat ripgrep fd-find fuse libfuse2 gnupg python3 python3-pip

# Install only individual components
zsh:
	@echo "Installing Zsh + Oh-My-Zsh..."
	@bash $(SCRIPTS_DIR)/10-install-zsh.sh

nodejs:
	@echo "Installing NodeJS + Yarn..."
	@bash $(SCRIPTS_DIR)/02-install-nodejs.sh

vscode:
	@echo "Installing Visual Studio Code..."
	@bash $(SCRIPTS_DIR)/03-install-vscode.sh

jetbrains:
	@echo "Installing JetBrains Toolbox..."
	@bash $(SCRIPTS_DIR)/04-install-jetbrainstools.sh

docker:
	@echo "Installing Docker CE..."
	@bash $(SCRIPTS_DIR)/05-install-docker.sh

brave:
	@echo "Installing Brave Browser..."
	@bash $(SCRIPTS_DIR)/06-install-brave.sh

ollama:
	@echo "Installing Ollama..."
	@bash $(SCRIPTS_DIR)/07-install-ollama.sh

virtualization:
	@echo "Installing Virtualization Tools (KVM, QEMU, virt-manager)..."
	@bash $(SCRIPTS_DIR)/08-install-virtualization.sh

neovim:
	@echo "Setting up Neovim IDE..."
	@bash $(SCRIPTS_DIR)/09-install-neovim.sh

# Backup Dotfiles (optional if you want)
# backup:
#	@echo "Backing up dotfiles..."
#	@bash $(SCRIPTS_DIR)/99-backup-dotfiles.sh

# Clean temporary files
clean:
	@echo "🧹 Cleaning temporary files (if any)..."
	@rm -rf /tmp/jetbrains-toolbox.tar.gz
	@rm -rf /tmp/*.tar.gz

# Show help
help:
	@echo ""
	@echo " Available Make targets:"
	@echo "  make install         -> Run full setup via orchestrator"
	@echo "  make update          -> Only update system packages"
	@echo "  make essentials      -> Install essential CLI tools manually"
	@echo "  make zsh             -> Install Zsh + Oh-My-Zsh + Powerlevel10k"
	@echo "  make nodejs          -> Install NodeJS + Yarn via NVM"
	@echo "  make vscode          -> Install Visual Studio Code"
	@echo "  make jetbrains       -> Install JetBrains Toolbox"
	@echo "  make docker          -> Install Docker CE"
	@echo "  make brave           -> Install Brave Browser"
	@echo "  make ollama          -> Install Ollama"
	@echo "  make virtualization  -> Install Virtualization Tools"
	@echo "  make neovim          -> Install and Configure Neovim IDE"
	@echo "  make backup          -> Backup dotfiles"
	@echo "  make clean           -> Clean temporary files"
	@echo ""
	@echo "Example: make install "
	@echo ""

