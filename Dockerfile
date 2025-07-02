FROM odoo:18.0

# Set environment variables (optional)
ENV HOST=0.0.0.0 \
    PORT=8069

# If you have custom addons in the repo, uncomment this:
# COPY ./custom-addons /mnt/extra-addons
# RUN chown -R odoo:odoo /mnt/extra-addons

EXPOSE 8069

CMD ["odoo"]
