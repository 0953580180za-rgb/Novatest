FROM grafana/grafana:latest

# copy config grafana.ini
COPY conf/grafana.ini /etc/grafana/grafana.ini

# copy start.sh
COPY start.sh /start.sh

# start container ใช้ start.sh
CMD ["/start.sh"]
