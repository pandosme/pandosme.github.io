---
layout: post
title:  "Head counter"
date: 2022-10-08 00:00:00 +0200
categories: [ACAP, MQTT, Component]
---

Detects humans heads and sends three different events upon detection cchanges.  These events target different use cases.  
The detection behavior is optimized for less crowded scenes and people are somewhat stationary.

* Counter:  The number of heads in the scene
* Occupancy: True/False if there are any heads
* Limit: True/False if the number of heads exceeds a user-defined level

![image]({{ site.url }}/assets/headcounter.jpg)

# Prerequisite
1. Axis camera  
2. [Head counter](https://api.aintegration.team/acap/headcounter?source=pages) ACAP
3. Some client or system that consumes the events for some use case

# Configuration
There will always be some level of false detections depending on scene, lighting or behavior that needs to be managed.  Adjust filters until you have acceptable behavior in the validation view.

## Validation
The augmented video shows a bounding box where head detections occur.  There is a latency between video and augmentation.
Green boxes shows that the head will be counted, yellow boxes will be ignored. 
Each box shows how many seconds a specific head has been detected. It also shows the confidence level of the detection.
Use this data to adjust areas, size, time and confidence level.

## Set detection area
Click the buton and use the mouse to define the area the heads must be present

## Set ignore area
Use this filter if there is a small area in the area-of-interest that should be excluded.

## Minimum head size
Use this filter to eliminate small false detections.

## Maximum head size
Use this filter to eliminate large false detections.

## Confidence level
Adjust depending on the false detections.

## Minimum presence
Use this filter to reduce sporadic detections.  
_Note that the detection may lose tracking of a head and thus restart presence time_

## Limit alert
Generates an event if the number of heads exceeds the limit.  

# Integration
The following events are fired and published on VAPIX/ONVIF event stream
* Head counter update: tnsaxis:CameraApplicationPlatform/headcounter/counter  
Payload property "value"
* Head presence: tnsaxis:CameraApplicationPlatform/headcounter/precense  
Payload property "state"
* Head limit: tnsaxis:CameraApplicationPlatform/headcounter/precense  
Payload property "state" True = Counter is above limit, False = Counter is below or equal to limit  
  
An MQTT client in the camera can be used to publish the above events.

