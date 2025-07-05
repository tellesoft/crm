FROM python:3.10-slim

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    libsasl2-dev \
    libldap2-dev \
    wkhtmltopdf \
    git \
    curl \
    npm \
    node-less \
    python3-dev \
    libjpeg-dev \
    libffi-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Python packages
COPY requirements.txt /tmp/
RUN pip install --upgrade pip && pip install -r /tmp/requirements.txt

# Add Workify source code
COPY . /opt/workify
WORKDIR /opt/workify

# Make sure addons path is known
ENV ADDONS_PATH=/opt/workify/addons

# Run the app
CMD ["python", "odoo-bin", "-c", "/opt/workify/debian/odoo.conf"]
