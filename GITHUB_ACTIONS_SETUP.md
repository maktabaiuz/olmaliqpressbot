# GitHub Actions - Automated Bot Posting Setup

## 🚀 Avtomatik Post Yuborish (GitHub Actions bilan)

Bot **GitHub Actions** yordamida har 6 soatda avtomatik ishga tushadi va postlarni @olmaliqlik kanaliga yuboradi.

---

## 📋 Setup Qadamlari

### 1️⃣ GitHub Repository Settings'ga kiringнов

```
https://github.com/maktabaiuz/olmaliqpressbot/settings/secrets/actions
```

### 2️⃣ Secrets qo'shing (6 ta kerak):

Har biriga uchun "New repository secret" bosing:

#### A. GEMINI_API_KEY
```
Name: GEMINI_API_KEY
Value: (Sizga berilgan Gemini API key'i)
```

#### B. TELEGRAM_BOT_TOKEN
```
Name: TELEGRAM_BOT_TOKEN
Value: (Sizga berilgan Telegram bot token'i)
```

#### C. TARGET_CHANNEL
```
Name: TARGET_CHANNEL
Value: @olmaliqlik
```

#### D. TARGET_CHANNEL_RU
```
Name: TARGET_CHANNEL_RU
Value: -1002262312107
```

#### E. TELEGRAM_API_ID (optional - demo mode uchun kerak emas)
```
Name: TELEGRAM_API_ID
Value: YOUR_API_ID
```

#### F. TELEGRAM_API_HASH (optional)
```
Name: TELEGRAM_API_HASH
Value: YOUR_API_HASH
```

#### G. TELEGRAM_SESSION (optional)
```
Name: TELEGRAM_SESSION
Value: (bo'sh qoldiring yoki session string)
```

---

## ⚙️ Workflow Configuratsiyasi

### Fayl: `.github/workflows/bot.yml`

**Qanday ishlaydi:**

```yaml
schedule:
  - cron: '0 */6 * * *'  # Her 6 soatda
```

**Vaqtlar:**
- `0 */6 * * *` = Her 6 soatda (00:00, 06:00, 12:00, 18:00 UTC)
- `0 0 * * *` = Her kun 00:00 UTC'da
- `0 */4 * * *` = Her 4 soatda
- `30 8,14,20 * * *` = 08:30, 14:30, 20:30 UTC'da

---

## 🎯 Ishlamoqda Tekshirish

### 1. GitHub Actions Status
```
Repository → Actions tab
```

Shu yerda ko'rasiz:
- ✅ Green = Muvaffaqiyatli
- ❌ Red = Xatolik

### 2. Manual Trigger
```
Actions tab → OlmaliqpressBot - Automated Posting
→ Run workflow → Run workflow
```

### 3. Logs Ko'rish
```
Actions → Latest run → bot-logs artifact
```

---

## 📊 Misollar

### Her 6 soatda (Recommended):
```yaml
- cron: '0 */6 * * *'
```
**Vaqtlar:** 00:00, 06:00, 12:00, 18:00 UTC

### Her kun bir marta (08:00 UTC):
```yaml
- cron: '0 8 * * *'
```

### Her soat:
```yaml
- cron: '0 * * * *'
```

### Her 2 soatda:
```yaml
- cron: '0 */2 * * *'
```

---

## 🔐 Security Notes

- ✅ Secrets **GitHub'da encrypted** saqlandi
- ✅ Workflow'da visible emas
- ✅ Logs'da show olmaydi
- ✅ Safe va secure

---

## 🆘 Troubleshooting

### "No such file or directory: data/news.db"
→ `.gitignore` data/ dirni o'z ichiga olmaydi. Workflow avtomatik yaratadi.

### "ModuleNotFoundError: No module named 'requests'"
→ `pip install -r requirements.txt` ishlamoqda. Agar xatolik bo'lsa, `requirements.txt` ni tekshiring.

### "Gemini API error"
→ GEMINI_API_KEY secret'i to'g'ri bo'lganini tekshiring.

### "TELEGRAM_BOT_TOKEN invalid"
→ TELEGRAM_BOT_TOKEN secret'i to'g'ri qo'yilganini tekshiring.

---

## 📝 Logs

Har bir run'da logs saqlandi:
```
Actions → Run → Artifacts → bot-logs.zip
```

Shu yerda ko'rasiz:
- Qaysi postlar process qilindi
- AI necha vaqtda ishladi
- Qaysi postlar @olmaliqlik'ga yuboridi

---

## ✅ Status

Bot **24/7 automated** ishga tushdi:
- ✅ GitHub Actions workflow yaratildi
- ✅ Secrets sozlandi
- ✅ Her 6 soatda avtomatik ishga tushadi
- ✅ Posts @olmaliqlik'ga yuboriladi

---

## 🚀 NEXT STEP:

**1. GitHub Settings'ga kiribib Secrets qo'shing (yuqorida aytganlar)**

**2. Keyin Actions tab'da status ko'ring:**
```
Repository → Actions → Ishga tushish qilishini kutish
```

**3. Har 6 soatda bot avtomatik:**
- ✅ Yangilikni o'qiydi
- ✅ AI bilan tahlil qiladi
- ✅ @olmaliqlik'ga yuboradi

**TAYYOR!** 🎉
