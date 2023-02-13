---
layout: post
title:  "Presence Detection ACAP"
date: 2022-10-10 00:00:00 +0200
categories: [ACAP, MQTT, Component]
---

Presence detector targets non-critical use cases for low limit crowds where people are somewhat stationary in movement.  Common typical use cases are presence automation, dwell-time, loitering and queue management.

![image]({{ site.url }}/assets/presence.jpg)

# Detections
Presence detects humans by using the camera built-in head detection video analytics.  The performance may very on the scene, camera placement, light condition, camera platform and camera firmware version. 
  
The benefit of using head detection compared to common motion detection is that head detation does not require a person to move to be detected.  The benefit of using head detection compared to human/person detection is that part of the body may be hidden behind objects.  


# Prerequisite
1. A compliant Axis camera  
_Camera based on Arm7hf or AARCH64 that supports Axis AOA (Axis Object Analytics)_
2. [Presence Detection](https://api.aintegration.team/acap/presence?source=pages) ACAP
3. Some client or system that consumes the events for some use case

# Configuration
There will always be some level of false detections depening on scene, ligting or behaviour that needs to be managed.  Adjust filters until you have acceptable behaviour in the validation view.

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
Adjust depending on the false detections.  Start with Very low, view the augmentation and move up level if needed.

## Trigger after
Defines how long a head detection needs to be stable to impact the counter.  This reduces false detections for sporadic changes.  Use with caution as this may also result in missing detections for scenes where head detection is unstable.
_Note that the detection may lose tracking of a a specific head detection.  A new detection may occur on the same head having a new timer starting_

## Trigger timeout
After a positive presence state it will be kept high until timeout.  New detections during timeout will extend timeout timer.  

## Minimum presence
For a use case that is only interested when more than 1 person is detected in the scene. 

# Integration
The following events are fired and published on VAPIX/ONVIF event stream
* Presence detection: tnsaxis:CameraApplicationPlatform/presence/detection  
Payload property "state"
* Presence counter: tnsaxis:CameraApplicationPlatform/presence/counter  
Payload property "value"  
The counter will be fiered on any counter transitions regardless of the presence state 
  
An MQTT client in the camera can be used to publish the above events.

