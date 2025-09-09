# Grafana on Heroku (Docker)

## How to use
1. Replace `dashboards/power_meter.json` with your exported dashboard (Share → Export → Export for sharing).
2. Set environment variables on Heroku (Config Vars):
   - `GF_SECURITY_ADMIN_USER` and `GF_SECURITY_ADMIN_PASSWORD`
   - `INFLUX_URL` (e.g. `https://us-east-1-1.aws.cloud2.influxdata.com`)
   - `INFLUX_ORG`, `INFLUX_BUCKET`, `INFLUX_TOKEN`
3. Build & deploy:
   ```bash
   heroku create your-grafana-app
   heroku stack:set container -a your-grafana-app
   heroku addons:create heroku-postgresql:mini -a your-grafana-app
   heroku config:set GF_SECURITY_ADMIN_USER=admin GF_SECURITY_ADMIN_PASSWORD=StrongPass123! -a your-grafana-app
   heroku config:set INFLUX_URL=https://YOUR-INFLUX-URL INFLUX_ORG=YOUR_ORG INFLUX_BUCKET=YOUR_BUCKET INFLUX_TOKEN=YOUR_TOKEN -a your-grafana-app

   heroku container:login
   heroku container:push web -a your-grafana-app
   heroku container:release web -a your-grafana-app
   heroku open -a your-grafana-app
   ```

Notes:
- Grafana data stores in Heroku Postgres, not local filesystem.
- To install plugins persistently, set `GF_INSTALL_PLUGINS` as a Heroku Config Var.
