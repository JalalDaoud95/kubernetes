FROM rockylinux:8

LABEL maintainer="jalal.h.daoud@gmail.com"

# Install required packages
RUN yum install -y httpd \
    zip \
    unzip \
    && yum clean all

# Copy the template archive (you must download it and place it in your repo first)
COPY photogenic.zip /var/www/html/

# Set working directory
WORKDIR /var/www/html/

# Extract and organize files
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Expose ports
EXPOSE 80 22

# Run Apache in foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
