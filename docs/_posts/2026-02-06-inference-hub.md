---
layout: post
title: "DetectX Inference Hub: Bring Custom AI to Your Entire Camera Fleet"
date: 2026-02-06
categories: [ACAP]
image: /assets/hub.png
---

DetectX Inference Hub enables Axis cameras without a DLPU to perform custom object detection by offloading inference to a single ARTPEC‑9 camera. This gives each camera the same capabilities as if it were running DetectX with a custom model on a DLPU.

## How It Works

- **DetectX Inference Hub** ([detectx-server](https://github.com/pandosme/detectx-server)): Runs on an ARTPEC‑9 camera, hosting your custom TFLite model and exposing a simple HTTP API for inference.
- **DetectX Client** ([detectx-client](https://github.com/pandosme/detectx-client)): Runs on any Axis camera (ARTPEC‑7, 8, or 9). It captures video frames and sends them to the Inference Hub for analysis, then publishes results via MQTT, ONVIF, or web overlays.

You only need one Inference Hub in your network, but you can run the client on as many cameras as you like—each client can connect to any available hub.

## Benefits

- **Cost-effective AI upgrade:** Add object detection to older cameras without hardware replacement.
- **Centralized model management:** Update your model in one place; all clients benefit instantly.
- **Flexible deployment:** Mix and match camera generations; clients and hub can run anywhere on the network.
- **Custom AI:** Use your own TFLite models, tailored to your needs.
- **Open and extensible:** Full details, setup, and code are available in the [detectx-server](https://github.com/pandosme/detectx-server) and [detectx-client](https://github.com/pandosme/detectx-client) repositories.

## Drawbacks

- **Requires at least one ARTPEC‑9 camera** to act as the Inference Hub.
- **Network dependency:** Clients need reliable connectivity to the hub; network latency adds to inference time.
- **Throughput limits:** The hub can only process a few requests in parallel (default: 3); very large fleets may need multiple hubs.

## Learn More

For installation guides, API details, and advanced configuration, see:
- [DetectX Inference Hub (Server) GitHub](https://github.com/pandosme/inference)
- [DetectX Client GitHub](https://github.com/pandosme/detectx-client)

With DetectX Inference Hub, you can modernize your entire camera fleet with custom AI—quickly, flexibly, and affordably.
![image](https://api.juhlin.me/image/hub)