---
layout: post
title:  "Custom Radar Data Analytics"
date: 2024-05-06 00:00:00 +0200
categories: [Node-RED]
---

Node-RED Installer version 4.1.1 has built-in support for Axis D2110 Radar.  By installing Node-RED on the Radar provides an easy way to proccess data for various use cases.

Data provided:
* Unique id for tracking
* Object class [Human, Vehicle]
* Velocity (user configurable: m/s, km/h, mph)
* Top Velocity (maximum speed)
* Direction/Bearing in degrees related to the radar
* Object position in degrees realted to radar
* Distance to radar (user configurabel meters or feet)
* Position and distance in Birds-eye-view 2D coordinates (for plotting)
 
## Prerequisite 
1. Axis D2110 Radar with mounted SD Card
2. [Node-RED Installer](https://pandosme.github.io/acap/node-red/2023/09/12/nodered-acap.html)

## Example Node-RED Flow
Import the Example Flow as your starting point

![image](https://api.aintegration.team/image/radar-analytics) 

![content](https://github.com/pandosme/pandosme.github.io/assets/10496549/9d9c8bf0-f0bd-4e8f-9798-d539b9e7b243)
