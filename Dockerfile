FROM ubuntu:24.04

# Install all dependencies
RUN apt-get update && apt-get install -y \
    fortune-mod \
    cowsay \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy the wisecow script
COPY wisecow.sh .

# Make it executable
RUN chmod +x wisecow.sh

# Set environment so PATH is correct
ENV PATH="/usr/games:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# Expose the port
EXPOSE 4499

# Run the script
CMD ["./wisecow.sh"]

