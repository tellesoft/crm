FROM odoo:16.0

# Set environment variables (optional)
ENV HOST=0.0.0.0 \
    PORT=8069

# Copy any custom addons into the image
# (Skip this line if you don’t have custom modules)
# COPY ./custom-addons /mnt/extra-addons

# Set permissions
RUN chown -R odoo:odoo /mnt/extra-addons

# Expose default Odoo port
EXPOSE 8069

# Start Odoo
CMD ["odoo"]
