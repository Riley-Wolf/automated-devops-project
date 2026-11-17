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

# 7. Start the Flask application
CMD ["python", "app.py"]