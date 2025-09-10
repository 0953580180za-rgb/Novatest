FROM grafana/grafana:latest

# คัดลอก config ของเราไปทับตำแหน่งที่ Grafana ใช้จริง
COPY conf/grafana.ini /etc/grafana/grafana.ini

# คัดลอกสคริปต์เริ่มต้น
COPY start.sh /start.sh
RUN chmod +x /start.sh

# ให้ container รันผ่านสคริปต์ (ซึ่งจะ export GF_SERVER_HTTP_PORT ให้)
CMD ["/start.sh"]