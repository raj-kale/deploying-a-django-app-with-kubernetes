# Stage 1: Build stage
FROM python:3.9 AS builder

# Set working directory for the build stage
WORKDIR /app/backend

# Copy only the requirements file to install dependencies
COPY requirements.txt .

# Install dependencies in the build stage
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Runtime stage
FROM python:3.9-slim AS runtime

# Set working directory for the runtime stage
WORKDIR /app/backend

# Copy installed dependencies from the builder stage
COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin

# Copy application code to the runtime image
COPY . .

# Expose the application port
EXPOSE 8000

# Set the default command
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
