# === Install Ollama ===
if ! command -v ollama &> /dev/null; then
    echo "🔵 Installing Ollama..."
    curl -fsSL https://ollama.com/install.sh | sh
fi
