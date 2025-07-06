FROM python:3.10

# Set environment variables
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set working directory
WORKDIR /opt/odoo

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    wget \
    node-less \
    libpq-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    libsasl2-dev \
    libldap2-dev \
    libjpeg-dev \
    libffi-dev \
    libssl-dev \
    libjpeg8-dev \
    liblcms2-dev \
    libblas-dev \
    libatlas-base-dev \
    python3-dev \
    gcc \
    g++ \
    libevent-dev \
    libxrender1 \
    xfonts-75dpi \
    xfonts-base \
    libpq-dev \
    libjpeg-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for caching
COPY requirements.txt /tmp/requirements.txt

# Install pip dependencies (with gevent pin)
RUN pip install --upgrade pip \
    && pip install wheel \
    && pip install "gevent==21.12.0" \
    && pip install -r /tmp/requirements.txt

# Copy source code
COPY . /opt/odoo

# Create odoo user (optional for non-root execution)
RUN adduser --disabled-password --gecos "" odoo \
    && chown -R odoo:odoo /opt/odoo

USER odoo

# Default command to run odoo
CMD ["python", "odoo-bin"]
