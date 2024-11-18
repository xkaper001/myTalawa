FROM debian:latest

# Copy script to the container
COPY install.sh /install.sh

# Make the script executable
RUN chmod +x /install.sh && \
    apt-get update && \
    apt-get install -y git curl vim wget redis-server systemctl && \
    apt-get clean

# Start with bash and execute the script
CMD ["/bin/bash", "-c", "/install.sh && tail -f /dev/null"]