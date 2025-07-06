FROM python:3.10

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /opt/odoo

# System dependencies (removed libjpeg8-dev)
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
    libjpeg62-turbo-dev \
    libpng-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install dependencies
COPY requirements.txt /tmp/
RUN pip install --upgrade pip && \
    pip install wheel && \
    pip install -r /tmp/requirements.txt

# Copy source code
COPY . /opt/odoo

EXPOSE 8069

CMD ["python3", "odoo-bin", "-c", "/opt/odoo/debian/odoo.conf"]
