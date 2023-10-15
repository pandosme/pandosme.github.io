---
layout: post
title:  "Path Ingestion"
date: 2023-10-15 00:00:00 +0200
categories: [ACAP,Node-RED]
---

tis is an extension flow for [Node-RED Installer ACAP](https://pandosme.github.io/acap/node-red/2023/09/12/nodered-acap.html) that stores object paths detected by the xame into a MongoDB.

Object Paths can be use for a number of use cases.  The most common are:
* Forensic search
* Flow Heatmap
* Dwell Heatmap
* Counting

It is all about getting the object path data into a database to allow other applications to query this database.  One option is to install [ObjectPath ACAP](https://pandosme.github.io/acap/2023/03/16/Objects.html) in the camera.  This solution requires an MQTT broker and middleware that can take the Path messga and store it in a database.  A perfectly good solution.  
However, if you need a more dynamic and mainataineable solution there is an alternative option.  Run eveything in Node-RED on the camera that will store the path data into a mongodb wihtout going through a MQTT and middlware.  This solution can replace the solution with [ObjectPath ACAP](https://pandosme.github.io/acap/2023/03/16/Objects.html).  
Your application (whatever that may be) queires and process the data from the database.

### Prerequisite
* Axis Camera
* [Node-RED Installer ACAP](https://pandosme.github.io/acap/node-red/2023/09/12/nodered-acap.html)
* Access to a MongoDB. If you don't have a MonGoDB, this can easily be installed using docker with the following [docker-compose.yaml](https://github.com/pandosme/EmbeddedFlows/raw/main/resources/mongodb/docker-compose.yaml).

### Installation
Assumed that have the prerequisite...
* Import the [MongoDB Node](node-red-node-mongodb) into Node-RED via Menu | Manage Palette
* Copy the flow [Path Ingestion.json](https://github.com/pandosme/EmbeddedFlows/raw/main/flows/Path%20Ingestion.json) and import the flow via Menu | Import.
* Configure the MongoDB nodes to point to your MongoDB
* Deploy and go to the Node-RED Dashboard http://camera-ip:1880/ui

### Dashboard
The dashboard is mainly for for configuration and validation.  It queries the database and visulize a flow heatmep. Use the settings to ignore unwanted detections.  
![dashboard](https://github.com/pandosme/EmbeddedFlows/raw/main/images/dashboard_path_heatmap.jpg)

### Flows
You may need to adjust the flow.  Double-click on one of the brown MongoDB nodes and configure the address to your MongoDB.  Also, double-click the "Authentication Node" at the bottom of the Initiialization Group and set your cameras user and password.
![dashboard](https://github.com/pandosme/EmbeddedFlows/raw/main/images/flow_path_heatmap.jpg)
