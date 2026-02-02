---
layout: post
title: "Node-RED Installer ACAP"
date: 2023-09-12 05:00:00 +0200
categories: [ACAP, Node-RED]
excerpt: "Install and run Node-RED directly on Axis cameras with pre-installed device nodes."
image: /assets/node-red-contrib-host.JPG
---
[Node-RED](https://nodered.org) is a programming tool for wiring together hardware devices, APIs and online services in new and interesting
ways. It provides a browser-based editor that makes it easy to wire together flows using the wide range of nodes in the palette that can be deployed to its runtime in a single-click. 

Node-RED is typically installed on a computer or server such as Linux, Windows, 
Rasberry Pi or similar.  This is the common way to deploy Node-RED.  There maybe cases where Node-RED is needed for a 
specific solution with an Axis device and there are no other hosts available than the Axis device.  

## Axis specific nodes
Do you need to have a custom service on the device targeting a specific system, api or service not supported in the device?  You can develop this service without using Axis ACAP SDK that requires software embedded developer skills such as C, HTML, JavaScript and Linux.  There are pre-installed nodes to access common Axis device to resources.  With these nodes you can create sophisticated logic and integration that was previously only doable with ACAP SDK.  

![image]({{ site.url }}/assets/node-red-contrib-host.JPG)

Device Resource Nodes:
1. Listen to all events detected in the device.  Filter on a specific event to trigger a flow.
2. Fire a device event to trigger actions in the device or on a VMS (Video Management System) based on a flow logic.
3. Take a JPEG image that can be processed or sent to any service or API that Node-RED community supports.  Image cropping is supported.
4. Object analytics data including detections, trackers and paths.  This powerful node allows you easily process and filter  analytics for specific use cases like scene-specific detectors, automation, heatmapping, automation, forensic search and much more.

### [View Demonstration videos on Youtube](https://www.youtube.com/playlist?list=PLqJaAt9kTPXNxVIJXi7ixZPCvKqNeKQ_U)

Please read the help/documentation on each node for detailed information.  Import the example Nodes from your Node-RED Menu, Import, Examples, node-red-contrib-axis-host.  These examples shows how to secure your Node-RED and visualize objects in a dashboard.  You may need to import additional nodes in order for the examples to work (e.g. Dashbord nodes).  

## Prerequisite
- Axis camera
- Mounted SD Card
- Enable execution on SD Card
- Node-RED Installer ACAP
- Internet connection during installation

### [Download Node-RED Installer](https://www.dropbox.com/scl/fi/y5l64crciad3owm9rz56x/NodeRed-Installer.zip?rlkey=ncu7l5gm994rr3bo6nkyf1yz9&dl=1)
Pre-installed nodes:
- node-red-contrib-axis-host
- node-red-contrib-axis-com
- node-red-dashboard
- node-red-node-ui-table
- node-red-contrib-bcrypt (to simplify NodeRED password hash generation.  Import the example "Securitng NodeRED" to add/set credentials)

## Installation
1. Install the appropriate EAP file based on the device platform.  

IMPORTANT!
You must enable files to be executed from SD Card.
- In the camera GUI, go to System | Plain config
- Under "Select group", select "storage"
- Find the property "Extra mount options" on the left and set the value: exec.
- Click "Save".
- Unmount and mount SD Card or reboot the device
- Install Node-RED Installer

2. Start the ACAP.  This initiate installation of NodeJS, NPM and the latest Node-RED version on the device from official sources.  
_Note: Installation may take up to 3-4 minutes_
3. Use a browser and access Node-RED on http://device-IP-address:1880

## Reading and Writing files on the SD Card
Flows that need to store and read files (using the File Read & File Write nodes) on the SD Card should use the path starting with "sdcard".  
E.g. `sdcard/some/directory/file`

## Troubleshooting installation problems
* Is the exec-flag set and was the SD Card re-mounted or the device restarted afterwards?
* Is the SD Card formatted with ext4 (FAT32 will not work)?
* Is the Axis device behind a proxy and the proxy-values not set?
* Is the Axis device located on a protected network with no Internet Access?
* Does the Axis device have a valid Default Router set? (Typically set by DHCP) 
* Does the Axis device have a valid DNS Server?  (Typically set by DHCP)
 
## Updating Node-RED
You will typicall not need to upgrade the Node-RED Installer ACAP when new versions of Node-RED is available.  
1. Navigate to "Apps" in the camera menu
2. Stop Node-RED
3. Click Node-RED icon or the three dots (depening on the camera firmware version)
4. Checkbox "Update to latest version"
5. Click save
6. Start Node-RED
It may take a couple of minutes before the upgrade is complete.

## Things to consider
* The camera needs Internet access during installation.  If you are behind a proxy, select "Settings" and set proxy.
* Installing Node-RED on older Axis devices with limited RAM and FLASH may not work
* The Object (analytics) nodes may not work on older cameras or firmware.  If Axis AOA is installed it should work.
* Selected packages imported from the Node-RED community may not work due to limitations in Axis device.

## Security recommendations
Node-RED on an Axis device does not use the device's HTTP server nor the device's user authentication.   Anyone with access to the Axis device may use a Browser to access Node-RED.  It is highly recommended that you add credentials.  Node-RED describes this on [https://nodered.org/docs/user-guide/runtime/securing-node-red](https://nodered.org/docs/user-guide/runtime/securing-node-red).  By importing the example flow "Securing NodeRED" provides a way to edit the settings.js file.

<br/>
![image](https://api.aintegration.team/image/nodered-acap)
