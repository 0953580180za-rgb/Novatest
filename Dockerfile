FROM grafana/grafana:11.2.0

# ทำงานเป็น root เพื่อ copy ไฟล์
USER root
COPY --chown=472:472 provisioning/ /etc/grafana/provisioning/
COPY --chown=472:472 dashboards/   /var/lib/grafana/dashboards/

# กลับมาใช้ user grafana
USER grafana

# ไม่ต้องตั้ง ENV ของ PORT ที่ build-time

# สั่ง grafana ให้ bind 0.0.0.0 และใช้ PORT ที่ Heroku ใส่มาให้
CMD grafana-server \
  --homepath=/usr/share/grafana \
  --config=/etc/grafana/grafana.ini \
  --packaging=docker \
  --http-port=$PORT \
  --address=0.0.0.0
