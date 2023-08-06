---
layout: post
title:  "Running Node-RED on an Axis device"
date: 2020-01-02 00:00:00 +0200
categories: [ACAP, Node-RED]
---
[Node-RED](https://nodered.org) is typically installed on a computer or server such as Linux, Windows, 
Rasberry Pi or similar.  This is the common way to deploy Node-RED.  There maybe cases where Node-RED is needed for a 
specific solution with an Axis device and there are no other hosts available than the Axis device.  This is when Node-RED 
Installer ACAP comes handy.

<a href="https://www.buymeacoffee.com/fredjuhlinl" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>

## [Download Node-RED Installer](https://acap.juhlin.me/package/Nodered)

## Why Node-RED?
Node-RED is a programming tool for wiring together hardware devices, APIs and online services in new and interesting
ways. It provides a browser-based editor that makes it easy to wire together flows using the wide range of nodes in the
palette that can be deployed to its runtime in a single-click. 

## Prerequisite
- Axis camera
- Mounted SD Card  
_Not required for devices based on ARTPEC-8_
- Node-RED Installer

### Download [Node-RED Installer](https://acap.juhlin.me/package/Nodered)

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
Node-RED on an Axis devices do not use the device HTTP server nor the devices user authentication.  Anyone with access 
to the Axis device may use a Browser to access Node-RED.  It is highly recommended that you configure Node-RED with user 
credentials by following https://nodered.org/docs/user-guide/runtime/securing-node-red.

## Tips & Tricks
1. Import [AEDES MQTT broker Node](https://flows.nodered.org/node/node-red-contrib-aedes) to host a local MQTT Broker in the Axis Device.
2. Import [Axis Node](https://flows.nodered.org/node/node-red-contrib-axis-com) to simplify integration with the device Node-RED is running on.  Read [Working with Axis devices in Node-RED](https://pandosme.github.io/node-red/2020/01/02/AxisNode.html).
