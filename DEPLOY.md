# OlmaliqpressBot - Server Deployment Guide

## 🚀 Quick Deployment Steps

### 1. Server'ga clone qiling
```bash
cd /opt
sudo git clone https://github.com/maktabaiuz/olmaliqpressbot.git
cd olmaliqpressbot
sudo chown -R bot:bot .
```

### 2. `.env` faylini sozlang
```bash
sudo nano .env
# TELEGRAM_API_ID va TELEGRAM_API_HASH to'ldiring
```

### 3. Telegram Session yaratish (birinchi marta)
```bash
# Server'da ishga tushiring
python3 generate_session.py
# Telefon raqamingni kiritib, kodi'ni confirm qiling
# Session.string olinadi va .env ga saqlandi
```

### 4. Option A: Docker bilan (Recommended)
```bash
# Docker va Docker Compose o'rnatilgan bo'lsa:
sudo docker-compose up -d
sudo docker-compose logs -f  # Logs ko'rish uchun
```

### 5. Option B: Systemd Service bilan
```bash
# Python dependencies
sudo apt-get install python3-pip python3-venv
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Service fayl
sudo cp olmaliqpressbot.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable olmaliqpressbot
sudo systemctl start olmaliqpressbot
sudo systemctl status olmaliqpressbot
```

## 📋 Logs Ko'rish

**Docker:**
```bash
sudo docker-compose logs -f olmaliqpressbot
```

**Systemd:**
```bash
sudo journalctl -u olmaliqpressbot -f
```

## 🔄 Yangi versiyani deploy qilish
```bash
cd /opt/olmaliqpressbot
git pull origin main

# Docker
sudo docker-compose down
sudo docker-compose up -d

# Yoki Systemd
sudo systemctl restart olmaliqpressbot
```

## ⚠️ Troubleshooting

### "Telegram session expired"
```bash
rm -f *.session
python3 generate_session.py
```

### "Gemini API error"
- `.env` da `GEMINI_API_KEY` to'g'rili ekanini tekshiring
- https://ai.google.dev/en dan yangi key oling

### "Permission denied"
```bash
sudo chown -R bot:bot /opt/olmaliqpressbot
```
