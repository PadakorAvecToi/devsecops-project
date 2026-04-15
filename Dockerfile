FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

EXPOSE 5000

# Volontairement en root pour que Conftest le détecte plus tard
CMD ["python", "app.py"]