#!/bin/bash

# OlmaliqpressBot - Server Setup Script
# Foydalanish: sudo bash setup_server.sh

set -e

echo "🚀 OlmaliqpressBot Server Setup"
echo "================================"

# Check if running as root
if [[ $EUID -ne 0 ]]; then
   echo "❌ Bu script'ni root bilan ishga tushiring: sudo bash setup_server.sh"
   exit 1
fi

# Create bot user
if ! id "bot" &>/dev/null; then
    echo "👤 'bot' foydalanuvchi yaratilmoqda..."
    useradd -r -s /bin/bash bot
fi

# Clone repository
REPO_DIR="/opt/olmaliqpressbot"
if [ ! -d "$REPO_DIR" ]; then
    echo "📥 Repository clone qilinmoqda..."
    git clone https://github.com/maktabaiuz/olmaliqpressbot.git $REPO_DIR
fi

# Set permissions
chown -R bot:bot $REPO_DIR
chmod 700 $REPO_DIR

# Install Python dependencies
echo "📦 Python dependencies o'rnatilmoqda..."
cd $REPO_DIR
apt-get update
apt-get install -y python3-pip python3-venv ffmpeg

python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

# Create directories
mkdir -p $REPO_DIR/data $REPO_DIR/logs
chown -R bot:bot $REPO_DIR/data $REPO_DIR/logs

# Check for .env
if [ ! -f "$REPO_DIR/.env" ]; then
    echo "⚠️  .env fayli yo'q. Faqat qo'lda yarating."
    echo "   Namuna: cp .env.example .env"
fi

# Setup systemd service
echo "⚙️  Systemd service o'rnatilmoqda..."
cp $REPO_DIR/olmaliqpressbot.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable olmaliqpressbot

echo ""
echo "✅ Setup complete!"
echo ""
echo "📝 Keying qadamlar:"
echo "1. $REPO_DIR/.env ni sozlang"
echo "2. sudo -u bot python3 /opt/olmaliqpressbot/generate_session.py"
echo "3. sudo systemctl start olmaliqpressbot"
echo "4. sudo systemctl status olmaliqpressbot"
