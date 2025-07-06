FROM python:3.10

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

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
    libpng-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements.txt from repo root
COPY ./requirements.txt /opt/odoo/requirements.txt

# Install Python dependencies
RUN pip install --upgrade pip && \
    pip install wheel && \
    pip install "gevent==23.9.1" && \
    pip install -r requirements.txt

# Copy the rest of the code
COPY . /opt/odoo/

EXPOSE 8069

CMD ["python", "odoo-bin", "-c", "odoo.conf"]
