# OlmaliqpressBot - Docker image
FROM python:3.11-slim

WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy bot files
COPY . .

# Create necessary directories
RUN mkdir -p data logs

# Run bot in loop mode
CMD ["python", "main.py", "--loop"]
