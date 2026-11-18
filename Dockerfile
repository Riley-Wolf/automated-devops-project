# 1. Start with an official Python image
FROM python:3.13-slim

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy the dependency list into the container
COPY requirements.txt .

# 4. Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the application files into the container
COPY . .

# 6. Document the port used by the application
EXPOSE 5001

# 7. Check application health
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
    CMD python -c "import urllib.request; urllib.request.urlopen('http://127.0.0.1:5001/health', timeout=3)"
# 8. Start the Flask application
CMD ["gunicorn", "--workers", "2", "--bind", "0.0.0.0:5001", "app:app"]
