FROM odoo:18.0

ENV ODOO_VERSION=18.0 \
    ODOO_ADDONS_PATH=/mnt/extra-addons

# Create addons directory and copy as odoo user
USER root
RUN mkdir -p $ODOO_ADDONS_PATH

# Skip chown — just switch user first, then copy
USER odoo
COPY --chown=odoo:odoo ./addons $ODOO_ADDONS_PATH

EXPOSE 8069

CMD ["odoo", "--addons-path=/usr/lib/python3/dist-packages/odoo/addons,/mnt/extra-addons"]
