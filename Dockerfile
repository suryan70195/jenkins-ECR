# Use a base image with Python and Alpine
FROM python:3.8-alpine

# Install necessary system dependencies
RUN apk update && apk add --no-cache ca-certificates

# Install Python pip (make sure it's updated)
RUN pip install --upgrade pip

# Install Python dependencies from requirements.txt
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir --trusted-host pypi.org --trusted-host pypi.python.org -r /usr/src/app/requirements.txt

# Copy application code
COPY . /usr/src/app/

# Expose the necessary port
EXPOSE 5000

# Run the application
CMD ["python", "/usr/src/app/app.py"]
