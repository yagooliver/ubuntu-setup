# ✨ Ubuntu Developer Setup - Scripts

Welcome to my **Ubuntu Developer Automation Scripts**! 🚀  
This repository automates the installation and configuration of a **professional developer environment** on **Ubuntu**, **WSL**, or **cloud servers**.

---

## 📦 What's Included

- 🛠️ **System Setup Scripts** (modular and idempotent)
- 💻 **Zsh + Oh-My-Zsh** with **Powerlevel10k** theme
- ⚡ **Node.js** (via NVM) + **Yarn**
- 📝 **Visual Studio Code** installation
- 🐳 **Docker** + Docker Compose
- 🌐 **Brave Browser** installation
- 🧠 **Ollama** installer
- 🖥️ **Virtualization tools** (QEMU, KVM, Virt-Manager)
- 🔥 **Ultimate Neovim IDE Setup** (for .NET, ReactJS, Python)

---

## 🛠️ How to Use

Clone the repository:

```bash
git clone https://github.com/yagooliver/ubuntu-setup.git ~/ubuntu-setup
cd ~/ubuntu-setup
```

Run the full setup:

```bash
make install
```

Or run specific parts:

```bash
make zsh
make nodejs
make docker
make neovim
make backup
```

---

## 👤 Folder Structure

```bash
ubuntu-setup/scripts
├──── 01-install-essentials.sh
├──── 02-install-nodejs.sh
├──── 03-install-vscode.sh
├──── 04-install-jetbrainstools.sh
├──── 05-install-docker.sh
├──── 06-install-brave.sh
├──── 07-install-ollama.sh
├──── 08-install-virtualization.sh
├──── 09-install-neovim.sh
├──── 10-install-zsh.sh
├── orchestrator.sh
├── Makefile
└── README.md
```

✅ Each script checks if the software is already installed to avoid redundant installs.

---

## ✨ Features

- Fully modular - install parts separately
- Safe to re-run (idempotent scripts)
- Minimal and extendable
- Prepares systems for:
  - Backend Development (.NET, Python, Docker)
  - Frontend Development (ReactJS, Typescript)
  - Virtualization (VMs, Docker, KVM)

---

## 📜 License

MIT License - Free to use, modify, and extend. 🚀  
(⭐ Star this repo if it helps you!)

---
> “Automate your setup, accelerate your future.” ✨

