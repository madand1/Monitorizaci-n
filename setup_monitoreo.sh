#!/bin/bash

set -e

echo "Creando estructura de directorios..."
mkdir -p prometheus grafana/provisioning/datasources grafana/provisioning/dashboards

echo "Creando prometheus.yml..."
cat > prometheus/prometheus.yml <<EOF
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:9090']
EOF

echo "Creando datasource.yml para Grafana..."
cat > grafana/provisioning/datasources/datasource.yml <<EOF
apiVersion: 1
datasources:
  - name: Prometheus
    type: prometheus
    access: proxy
    url: http://prometheus:9090
    isDefault: true
EOF

echo "Creando docker-compose.yml..."
cat > docker-compose.yml <<EOF
services:
  prometheus:
    image: prom/prometheus:latest
    volumes:
      - ./prometheus/prometheus.yml:/etc/prometheus/prometheus.yml:ro
    ports:
      - "9090:9090"

  grafana:
    image: grafana/grafana:latest
    depends_on:
      - prometheus
    volumes:
      - ./grafana/provisioning:/etc/grafana/provisioning:ro
    ports:
      - "3000:3000"
    environment:
      GF_SECURITY_ADMIN_PASSWORD: admin
EOF

echo "Levantando contenedores con 'docker compose up -d'..."
docker compose up -d

echo "Proyecto levantado exitosamente."
echo "Accede a Prometheus: http://localhost:9090"
echo "Accede a Grafana: http://localhost:3000  (user: admin / pass: admin)"
