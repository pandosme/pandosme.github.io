---
layout: post
title:  "Direction Counter ACAP"
date: 2022-11-120 00:00:00 +0200
categories: [ACAP, MQTT, Component]
---

Counts object movement directions in the camera scene. It uses the cameras analytics services to track and count objects.

# Prerequisite
1. A compliant Axis camera  
_Camera based on Arm7hf or AARCH64 that supports Axis AOA (Axis Object Analytics)_
2. [Direction Counter](https://api.aintegration.team/acap/directioncounter?source=pages) ACAP
3. Some client or system that consumes the events for some use case

# Overview

An event is fired based on configuration that includes the total counter value.
The events data/value can be monitored with MQTT or ONVIF event stream.
It can also be used to trigger actions in the camera, VMS or some other system.  
You will find the following events in the cameras events [System | Events | Add Rule | Condition]  
1. Direction Counter: Down
2. Direction Counter: Left
3. Direction Counter: Right
4. Direction Counter: Up

## Installation
Depending on the product platform and its capabilities, install appropriate EAP-file in the camera.  
Supported platforms: ARMv7HF and AARCH64  
Supported cameras: Cameras supporting Axis Object Analytics (AOA)

The user interface has four areas (boxes) used for configuration and validation.

![image]({{ site.url }}/assets/presence.jpg)

# Counter view
Shows the current counter values and the last time they triggered.  
Select the counter movement that the use case required.  Disabe the counters that are not interesting.  
  
You can manually reset the counters while testing various configurations.  

## Settings
The settings area (top-right) is used to optimize the behaviour for the use case and consuming system.

### Area objects must pass
Click the edit and use the mouse to define an area that objects needs to pass while moving through the scene.  This will optimize behaviour and reduce false detections from uninteresting areas.

### Min. direction distance
Used to optimize counter behavior.  The unit is the percent movement for both horizontal and vertical motion (not the total distance).  
Example:  20% direction mevement
* If an object moves 30% to left and 10% up, the left counter will fire but not up.  
* If an object moves 10% to right and 40% down, the down counter will fire but not right.  
* If an object moves 40% to left and 40% down, both left and down will be fired.  

### Object type
Used to filter on persons or vehicles.  Should be used with caution as object classifications may fail.  Try different settings and see what works best for each scene.

### Time Group
- None:  Events will be fired on any counter change.  Typically used when each change needs to be monitor or to trigger some action (e.g. toggling an IO-port)
- X minutes:  All enabled counters will fire every X minutes, holding the total counter value from last reset.  Typically used when collecting counter values in a database.  

### Reset counters
Defines when counters will be reset  
  
* Manual reset:  
Either by pressing the "Reset Counter" button or by  an HTTP request
```
http://address/local/directioncounter/reset
```
* At Midnigt
* Time group:  When you want the counter values fired on each Time Group to only have the values from last event

# Video augmentation
The video with augmentation helps validate and optimize behaviour.  The last 15 objects will visualized with a yellow line (gradient to grey).  The bright yellow shows where it came from and the grey where it went.  THe last detection is represented as a white line.

# Detection table
The table shows the last 15 detectsion including data that can be used to optimize behaviour.  The table includes directions regardless if the direction counter is enabled or disabled.
