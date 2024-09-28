# Use an official Python runtime as a parent image
FROM python:3-slim

# Environment variables to avoid .pyc files and enable unbuffered logs
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install system dependencies (optional, based on your requirements)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    mosquitto-clients && \
    rm -rf /var/lib/apt/lists/*

# Copy requirements.txt first to leverage Docker cache
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set the working directory inside the container
WORKDIR /app

# Copy the rest of the application code
COPY . .

# Creates a non-root user with permissions for security
RUN adduser --disabled-password --gecos "" --uid 5678 appuser && \
    chown -R appuser /app

# Switch to the non-root user
USER appuser

# Expose MQTT port (if needed for external connections)
EXPOSE 1883

# Default command to run the Python script
CMD ["python", "mqtt_reader.py"]
