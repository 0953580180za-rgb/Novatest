FROM grafana/grafana:11.2.0

# ทำงานด้วยสิทธิ root ชั่วคราว
USER root

# คัดลอกไฟล์ พร้อมกำหนด owner เป็น UID/GID 472 (grafana)
COPY --chown=472:472 provisioning/ /etc/grafana/provisioning/
COPY --chown=472:472 dashboards/   /var/lib/grafana/dashboards/

# กลับไปใช้ user grafana
USER grafana

# รัน grafana และ bind กับพอร์ตที่ Heroku ส่งให้
CMD ["grafana-server","--homepath=/usr/share/grafana","--config=/etc/grafana/grafana.ini","--packaging=docker","--http-port=${PORT}"]
