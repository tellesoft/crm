FROM odoo:16

USER root

# Install any extra OS packages you need here (optional)
RUN apt-get update && apt-get install -y \
    nano \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Switch back to odoo user
USER odoo

# Copy your custom addons if any (optional)
# COPY ./custom-addons /mnt/extra-addons

# Set the default command
CMD ["odoo"]
