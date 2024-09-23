# Integrate Spring Boot With Grafana 🚀.

## Overview

This project demonstrates how to integrate a Spring Boot application with Grafana for real-time monitoring of application metrics. Instead of using Micrometer, we directly expose metrics through Spring Boot's built-in Actuator endpoints.

## Why Integrate Spring Boot with Grafana?

Monitoring application health and performance is essential for maintaining stability, especially in production environments. By using Spring Boot Actuator in combination with Prometheus and Grafana, you can capture and visualize important metrics such as HTTP request times, memory usage, CPU load, and more.

Grafana is an open-source tool for querying, visualizing, and alerting on metrics. When combined with Prometheus, which collects and stores these metrics, you can create interactive dashboards to track the health of your Spring Boot application.

### Components Involved:

- Spring Boot Application: Exposes operational metrics through Actuator. Metrics are accessible via the /actuator/prometheus endpoint (enabled by Prometheus).

- Prometheus: Scrapes metrics from the Spring Boot application. Acts as a time-series database, storing and managing the metrics data. Can be configured to scrape the metrics from the Spring Boot /actuator/prometheus endpoint.

- Grafana: Connects to Prometheus as a data source. Provides dashboards and visualization of the metrics collected from the Spring Boot app. Can create custom dashboards to track key metrics.

### High-Level Workflow:

- Spring Boot exposes application metrics using the Actuator's /actuator/prometheus endpoint.
- Prometheus scrapes the metrics data from this endpoint at regular intervals.
- Grafana queries the Prometheus server for the metrics and visualizes them in the form of graphs, charts, and alerts.
- You can monitor metrics such as HTTP request counts, error rates, memory usage, etc., in real-time.

### Key Metrics Monitored:

- JVM metrics: Heap memory usage, thread counts, garbage collection.
- HTTP requests: Request counts, response times, status codes.
- Application-specific metrics: You can extend Spring Boot Actuator to expose custom business metrics.

### Setup Instructions:

- Spring Boot Configuration:

  - Enable Actuator in the application.properties or application.yml file.
  - Configure the Actuator to expose the /actuator/prometheus endpoint for Prometheus scraping.
  - don't use (\*) in production this is not good you must determine what you need in your application , you can write (health , prometheus)

  ![application.properties](https://github.com/user-attachments/assets/d413ae84-69e2-4f1e-84b9-a9d17a81a298)

- Prometheus Configuration:

  - Set up Prometheus to scrape the Spring Boot application's /actuator/prometheus endpoint.
  - Update the prometheus.yml file with the Spring Boot app URL as a scrape target.

  ![prometheus.yml](https://github.com/user-attachments/assets/de2f6ff5-2828-4163-8f42-c964af3f50bf)

- Grafana Configuration:

  - Add Prometheus as a data source in Grafana.
  - Create or import Grafana dashboards to visualize Spring Boot metrics.

- Monitoring:

  - Use Grafana dashboards to monitor performance, set alerts, and analyze trends.
