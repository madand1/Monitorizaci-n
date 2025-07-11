# 🚀 Monitorización con Prometheus y Grafana

## 📋 Descripción

Este proyecto configura un sistema básico de monitorización utilizando **Prometheus** y **Grafana** dentro de contenedores Docker.

- 🔍 **Prometheus** recolecta y almacena métricas.
- 📊 **Grafana** visualiza esas métricas a través de dashboards.

El proyecto incluye un script (`setup_monitoreo.sh`) que automatiza la creación de la configuración inicial y el despliegue de los contenedores.

---

## ⚙️ Qué hace este proyecto

1. 📡 Configura Prometheus para hacer scraping de sus propias métricas.
2. 🔗 Configura Grafana con una datasource apuntando a Prometheus.
3. 🐳 Levanta los servicios de Prometheus y Grafana con Docker Compose.

---

## 🚀 Cómo usarlo

```bash
chmod +x setup_monitoreo.sh
./setup_monitoreo.sh
```
