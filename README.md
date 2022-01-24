# Simple Web Server

## What it does

Creates and deploys the helm chart for:

- Image: `simple-web`
- Registry: `acrinterview.azurecr.io`

## What's missing

- Ingress with `/eyal` path rule
- KEDA auto-scaler based on
  - memory + CPU metrics
  - Schedule (8:00 AM - 12:00 AM)
