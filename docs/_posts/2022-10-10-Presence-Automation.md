---
layout: post
title:  "Person presence automation integration with Node-RED"
date: 2022-10-10 00:00:00 +0200
categories: [Node-RED, MQTT, Recipe]
---

A PIR sensor is often used for triggering some automation when people enters a specific scene.  A camera can also be turned into PIR sensor by adding additional service to it.

# Prerequisite
1. A compliant Axis camera  
_Camera based on Arm7hf or AARCH64 that supports Axis AOA (Axis Object Analytics)_
2. [Presence Detection ACAP](https://pandosme.github.io/acap/mqtt/component/2022/10/09/presence-detection.html)
3. Node-RED middleware integration  
_Installed on any host including as [addon in the camera](https://pandosme.github.io/acap/node-red/component/2020/01/01/nodered-acap.html)_
4. Access to an MQTT broker  
_You can use Node-RED to host the broker by installing [Node-RED MQTT Broker](https://flows.nodered.org/node/node-red-contrib-aedes)_

# Setup
1. Install and configure [Presence Detection ACAP](https://pandosme.github.io/acap/mqtt/component/2022/10/09/presence-detection.html) in the camera
2. Configure the cameras MQTT Client or install [SIMQTT ACAP](https://pandosme.github.io/acap/mqtt/component/2021/10/18/simqtt.html)
3. Set up a Node-RED flow that subscribes to the Precense Detation event using MQTT
4. Capture, filter and transform to integrate into any system.

# Example
![image]({{ site.url }}/assets/presence-automation.jpg)
