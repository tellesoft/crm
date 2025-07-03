FROM odoo:18.0

# Set environment variables (optional but useful for consistency)
ENV ODOO_VERSION=18.0 \
    ODOO_ADDONS_PATH=/mnt/extra-addons

# Create directory for extra add-ons if needed
RUN mkdir -p $ODOO_ADDONS_PATH

# Copy your custom modules into the container
COPY ./addons $ODOO_ADDONS_PATH

# Ensure permissions
RUN chown -R odoo:odoo $ODOO_ADDONS_PATH

# Expose the default Odoo port
EXPOSE 8069

# Start Odoo with custom parameters if needed
CMD ["odoo", "--addons-path=/usr/lib/python3/dist-packages/odoo/addons,/mnt/extra-addons"]
