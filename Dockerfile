FROM grafana/grafana:11.2.0

# ทำงานด้วยสิทธิ root ชั่วคราวเพื่อ copy แล้วแก้สิทธิ์
USER root

# คัดลอก provisioning และ dashboards เข้า path มาตรฐานของ Grafana
COPY provisioning/ /etc/grafana/provisioning/
COPY dashboards/ /var/lib/grafana/dashboards/

# จัดสิทธิ์ให้ user grafana เข้าถึงไฟล์ได้
RUN chown -R grafana:grafana /etc/grafana /var/lib/grafana

# กลับไปใช้ user grafana (ปลอดภัยกว่า)
USER grafana

# รัน grafana โดยให้ bind กับพอร์ตที่ Heroku ส่งให้
CMD ["grafana-server","--homepath=/usr/share/grafana","--config=/etc/grafana/grafana.ini","--packaging=docker","--http-port=${PORT}"]
