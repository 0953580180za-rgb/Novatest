FROM grafana/grafana:11.2.0

USER root
COPY --chown=472:472 provisioning/ /etc/grafana/provisioning/
COPY --chown=472:472 dashboards/   /var/lib/grafana/dashboards/
USER grafana

CMD sh -c 'grafana-server \
  --homepath=/usr/share/grafana \
  --config=/etc/grafana/grafana.ini \
  --packaging=docker \
  --configOverrides=server.http_addr=0.0.0.0,server.http_port=${PORT}'

