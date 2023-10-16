---
layout: post
title:  "Path Data Ingestion (Object analytics ) using Node-RED Installer"
date: 2023-10-15 00:00:00 +0200
categories: [ACAP,Node-RED]
---

This is an extension flow for [Node-RED Installer ACAP](https://pandosme.github.io/acap/node-red/2023/09/12/nodered-acap.html) that stores detected object paths into a MongoDB.

Object Paths can be use for a number of use cases.  The most common are:
* Forensic search
* Flow Heatmap
* Dwell Heatmap
* Counting

It is all about getting the object path data into a database to allow other applications to query.  The flow allow you to easily inject path data directly into a MongoDB. You can configure the behaviour to eliminate unwanted detections at the source.  The solution does not require any messaging to a middlware that injects the data into a MongoDB.  Your application (whatever that may be) may query and process the path data from the database.

{% include youtube.html id="rkIBVKuKv84" %}

### Prerequisite
* Axis Camera (use the latest firmware version for best result).
* [Node-RED Installer ACAP](https://pandosme.github.io/acap/node-red/2023/09/12/nodered-acap.html).  _An SD Card may be required if the camera is not based on ARTPEC-8._
* The camera must have access to a MongoDB. If you don't have a MongoDB, this can easily be installed using docker with the following [docker-compose.yaml](https://github.com/pandosme/EmbeddedFlows/raw/main/resources/mongodb/docker-compose.yaml).

### Installation
Assumed that have the prerequisite:
1. Import the [MongoDB Node](node-red-node-mongodb) into Node-RED via Menu | Manage Palette
2. Copy the flow [Path Ingestion.json](https://acap.juhlin.me/package/pathingestion) and import the flow via Menu | Import.
3. Configure the MongoDB nodes to point to your MongoDB
4. Deploy and go to the Node-RED Dashboard http://camera-ip:1880/ui

### Dashboard
The dashboard is mainly for for configuration and validation.  The flow supports all cameras with firmware 10.x and above, regardless of aspect ration and rotation.  The dashboard queries the visulize a flow heatmap. Use the settings to ignore unwanted detections.  
![dashboard](https://github.com/pandosme/EmbeddedFlows/raw/main/images/dashboard_path_heatmap.jpg)

### Flows
You will need need to adjust the flow.  Double-click on one of the brown MongoDB nodes and configure the address to your MongoDB.  Also, double-click the "Authentication Node" at the bottom of the Initiialization Group and set your cameras user and password.
![dashboard](https://github.com/pandosme/EmbeddedFlows/raw/main/images/flow_path_heatmap.jpg)
