# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /app

# Copy a sample Python script into the container
COPY test_script.py .

# Run the Python script when the container starts
CMD ["python", "test_script.py"]
#####
