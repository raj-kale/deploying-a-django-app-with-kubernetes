FROM python:3.9

WORKDIR /app/backend

# Copy requirements file first to leverage Docker cache for dependencies
COPY requirements.txt /app/backend

# Install system dependencies and Python dependencies in one layer
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && pip install --no-cache-dir -r requirements.txt \
    && rm -rf /var/lib/apt/lists/*

# Install mysqlclient separately (if not included in requirements.txt)
#RUN pip install mysqlclient

# Copy the entire app code after dependencies to take advantage of Docker layer caching
COPY . /app/backend

# Expose the application port
EXPOSE 8000

# Optional: Run migrations and make migrations (or do it manually in runtime)
# RUN python manage.py migrate
# RUN python manage.py makemigrations

# Specify the default command to run the app (could be `python manage.py runserver` for Django)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
