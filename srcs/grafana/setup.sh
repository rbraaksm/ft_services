cd grafana-7.3.4
./bin/grafana-server

# grafana-cli admin reset-admin-password ft_services
ENV		GF_SECURITY_ADMIN_USER=rbraaksm
ENV		GF_SECURITY_ADMIN_PASSWORD=ft_services