FROM grafana/grafana:11.2.0

USER root
COPY --chown=472:472 provisioning/ /etc/grafana/provisioning/
COPY --chown=472:472 dashboards/ /var/lib/grafana/dashboards/
USER grafana

# ไม่ต้องตั้ง ENV GF_SERVER_HTTP_PORT ที่ build time

# ใช้ shell form เพื่อให้ $PORT ถูกแทนค่าจริงตอนรันบน Heroku
CMD grafana-server \
  --homepath=/usr/share/grafana \
  --config=/etc/grafana/grafana.ini \
  --packaging=docker \
  --http-port=$PORT \
  --address=0.0.0.0
