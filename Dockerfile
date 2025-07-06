# Start from the official Odoo 16 image
FROM odoo:18.0

# (Optional) Switch to root to install custom packages
USER root

# Install any extra system dependencies (add more if needed)
RUN apt-get update && apt-get install -y \
    nano \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# (Optional) If you have custom addons in the repo, copy them in
# COPY ./custom-addons /mnt/extra-addons

# Switch back to the odoo user
USER odoo

# Set default command
CMD ["odoo"]
