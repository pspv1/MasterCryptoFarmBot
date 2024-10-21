# Use Debian as the base image
FROM debian:bullseye-slim

# Install system dependencies and Python
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    bash \
    curl \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy project files to the container
COPY . .

# Make the start_linux.sh script executable
RUN chmod +x start_linux.sh

# Expose the port the application will listen on
EXPOSE 3232

# Command to run the application
CMD ["./start_linux.sh"]
