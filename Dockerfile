# Use the official Python image from Docker Hub
FROM python:3.9-slim

# Copy the requirements.txt file into the container
COPY requirements.txt .

# Install dependencies listed in requirements.txt (including Django)
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Apply database migrations
RUN python manage.py migrate

# Expose port 8000 to allow access to the app
EXPOSE 8000

# Start the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

