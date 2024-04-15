---
layout: post
title:  "Custom Device Provisioning"
date: 2024-04-15 00:00:00 +0200
categories: [Node-RED]
---

When ADM5 or ADMx cannot be used as an Axis device provisioning tool, scripting is the best way to go.  This Node-RED flow provides a simple template solution for common case mass configurations.  It is easy to extend the template for non-common cases.

## Typical use cases:
* Mass deployment of Axis devices
* Device Configuration Policy enforcer
* Staging
 
## Prerequisite 
1. Windows, Linux or Mac PC with [Node-RED Installed]
2. Import [node-red-subflow-axis-provisioning](https://flows.nodered.org/node/node-red-subflow-axis-provisioning)

## Usage
1. As a starting template, import exampel flow [Menu | Import | Examples | node-red-subflow-axis-provisioning | Axis Device Provisioning ) into Note-RED
2. Double-click "Adjust device configuration here" and edit the JSON data to your policy
3. Double-click "Adjust Device Inventory here" and edit your device inventory.
   _Note that you can youe a wide range of way to populate your inventory_
4. Trigger the inject node "Initialize"
5. Trigger the inject node "Provision"

### Demonstration video
{% include youtube.html id="38pktKDa_2M" %}
