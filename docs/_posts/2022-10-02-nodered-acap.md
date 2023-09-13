---
layout: post
title:  "Running Node-RED on an Axis device"
date: 2023-09-12 05:00:00 +0200
categories: [ACAP, Node-RED]
---
[Node-RED](https://nodered.org) is typically installed on a computer or server such as Linux, Windows, 
Rasberry Pi or similar.  This is the common way to deploy Node-RED.  There maybe cases where Node-RED is needed for a 
specific solution with an Axis device and there are no other hosts available than the Axis device.  

Do you need to have a custom service on the device targeting a specific system, api or service not supported in the device?  You can develop this service without using Axis ACAP SDK or be a software developer.  The Node-Red-Installer comes with pre-installed nodes that provides access to resources inside the device.  With these nodes you can create sophisticated logic and integration that was previously only doable with ACAP.  

Device Resource Nodes:
1. Listen to all events detected in the device.  Filter on a specific event to trigger a flow.
2. Fire a device event to trigger actions in the device or on a VMS (Video Management System) based on a flow logic.
3. Take a JPEG image that can be processed or sent to any service or API that Node-RED community supports.  Image cropping is supported.
4. Object analytics data including detections, trackers and paths.  This powerful node allows you easily process and filter  analytics for specific use cases like scene-specific detectors, automation, heatmapping, automation, forensic search and much more.

Import the example Nodes from your Node-RED Menu, Import, Examples, node-red-contrib-axis-host.  These examples shows how to secure your Node-RED and visualize objects in a dashboard.  You may need to import additional nodes in order for the examples to work (e.g. Dashbord nodes).  

By importing the [Axis Com Node](https://flows.nodered.org/node/node-red-contrib-axis-com) you can extend the integration with the device that Node-RED is running on.  Read [Working with Axis devices in Node-RED](https://pandosme.github.io/node-red/2020/01/02/AxisNode.html).

## Why Node-RED?

Node-RED is a programming tool for wiring together hardware devices, APIs and online services in new and interesting
ways. It provides a browser-based editor that makes it easy to wire together flows using the wide range of nodes in the
palette that can be deployed to its runtime in a single-click. 

## Prerequisite
- Axis camera
- Mounted SD Card  
_Not required for devices based on ARTPEC-8_
- Node-RED Installer

### [Download Node-RED Installer Version 3.5](https://acap.juhlin.me/package/Nodered)

### [Download Node-RED Bundle](https://acap.juhlin.me/package/Bundle)
The bundle version is Node-RED Installer with the following common packages pre-installed
- node-red-dashboard
- node-red-node-ui-table
- node-red-contrib-axis-com
- node-red-contrib-bcrypt (to simplify NoeRed password hashing.  Import the example "Securitng NodeRED" to add/set credentials)

## Installation

1. Install the appropriate EAP file based on the device platform.  
2. Start the ACAP.  This initiate installation of NodeJS, NPM and the latest Node-RED version on the device from official Node-RED sources.  
_Note: Installation may take up to 3-4 minutes_
3. Use a browser and access Node-RED on http://device-IP-address:1880

## Updating Node-RED
The installer installs the latest Node-RED version.  It is als possible to update Node-RED.   You must use the device legacy interface.
1. Navigate to "Apps"
2. Click Node-RED icon
3. Checkbox "Update to latest version"
4. Click save.  
It may take a couple of minutes before the upgrade is complete.

## Things to consider
* The camera needs Internet access during installation.
* Installing Node-RED on older Axis devices with limited RAM and FLASH may not work
* Some imported Node-RED packages may not work due to limitations in Axis device

## Security recommendations
Node-RED on an Axis device does not use the device's HTTP server nor the device's user authentication.   Anyone with access 
to the Axis device may use a Browser to access Node-RED.  It is highly recommended that you add credentials.  Node-RED describes this on https://nodered.org/docs/user-guide/runtime/securing-node-red.  By importing the example flow "Securing NodeRED" provides a way to edit the settings.js file.

