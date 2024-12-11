FROM debian:latest

# Copy script to the container
COPY install.sh /install.sh

RUN chmod +x /install.sh && \
    ./install.sh

RUN service redis-server start

CMD ["/bin/bash", "-c", " echo \"DOCKER SETUP COMPLETED\" && tail -f /dev/null"]
