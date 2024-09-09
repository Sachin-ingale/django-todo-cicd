# Use an official Python runtime as a parent image
FROM python:3.12

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Expose port 8000 for the app
EXPOSE 8000

# Set environment variables
ENV DJANGO_SETTINGS_MODULE=todoApp.settings

# Run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
