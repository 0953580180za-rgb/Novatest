#!/bin/sh
# บังคับให้ Grafana ใช้พอร์ต $PORT ของ Heroku และฟังทุก interface
export GF_SERVER_HTTP_PORT="${PORT}"
export GF_SERVER_HTTP_ADDR="0.0.0.0"

# (ถ้าคุณจะใช้ Postgres ในภายหลัง ไม่ต้องแก้ตรงนี้)

# รัน Grafana ด้วย config ที่เราคัดลอกไว้
exec grafana-server \--homepath=/usr/share/grafana \--config=/etc/grafana/grafana.ini \--packaging=docker
