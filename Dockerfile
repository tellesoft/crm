FROM odoo:18.0

ENV ODOO_VERSION=18.0 \
    ODOO_ADDONS_PATH=/mnt/extra-addons

RUN mkdir -p $ODOO_ADDONS_PATH

COPY ./addons $ODOO_ADDONS_PATH

RUN chown -R odoo:odoo $ODOO_ADDONS_PATH

EXPOSE 8069

CMD ["odoo", "--addons-path=/usr/lib/python3/dist-packages/odoo/addons,/mnt/extra-addons"]
