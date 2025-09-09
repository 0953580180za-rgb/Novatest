FROM grafana/grafana:11.2.0
USER root
COPY --chown=472:472 provisioning/ /etc/grafana/provisioning/
COPY --chown=472:472 dashboards/ /var/lib/grafana/dashboards/
USER grafana

CMD grafana-server \
    --homepath=/usr/share/grafana \
    --config=/etc/grafana/grafana.ini \
    --packaging=docker \
    --http-port=$PORT \
    --address=0.0.0.0
