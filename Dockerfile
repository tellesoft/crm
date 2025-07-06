FROM python:3.10

LABEL maintainer="info@odoo.com"

ENV LANG C.UTF-8

# Install required system packages
RUN apt-get update && \
    apt-get install -y \
    git \
    build-essential \
    python3-dev \
    libev-dev \
    libldap2-dev \
    libsasl2-dev \
    libxml2-dev \
    libxslt1-dev \
    libjpeg-dev \
    zlib1g-dev \
    libpq-dev \
    libffi-dev \
    libssl-dev \
    wget \
    node-less \
    npm && \
    apt-get clean

# Upgrade pip and install Python dependencies
COPY requirements.txt /tmp/
RUN pip install --upgrade pip && \
    pip install wheel && \
    pip install -r /tmp/requirements.txt

# Set workdir
WORKDIR /odoo

# Copy source code
COPY . /odoo

# Expose ports
EXPOSE 8069 8071

# Default command
CMD ["python", "odoo-bin"]
