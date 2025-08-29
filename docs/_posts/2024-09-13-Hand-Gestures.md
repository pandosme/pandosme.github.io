---
layout: post
title:  "Hand Gesture Detection"
date: 2024-09-13 00:00:00 +0200
categories: [ACAP]
---

DetectX Hand Gesture is an ACAP to be installed in Axis Communications Cameras.  It provides real-time detection designed for users to communicate with a system using hand gestures.
**Intended for system integrators**, all outputs are designed for machine-to-machine (M2M) workflows, with flexible configuration from a built-in web UI and standards-based output via MQTT, ONVIF, or HTTP.

Examples of use cases are:
* Healthcare:Patient/nurse communication. Greater accessibility and autonomy.
* Retail: Customer satisfaction monitoring, customer asisstance needed, silent staff alert notifications.
* Industry: Touchless machine control. Enhanced safety and efficiency.
* Consumer/home: Smart home device management. Hands-free convenience.
* Accessibility: Adaptive tech for disabilities. Inclusive interface design  
 
![gestures](https://raw.githubusercontent.com/hukenovs/hagrid/Hagrid_v1/images/gestures.jpg)

### Demonstration video
Sorry if the ACAP will obscure the hand gestures but you can still see what I am doing in the window.  
{% include youtube.html id="GYcOC71_BoM" %}

### [Download ACAP](https://www.dropbox.com/scl/fi/92rsm7zkqxlaqvxlfq038/HandGestures.zip?rlkey=ukyzhemobwgncuw2zi47099f6&st=y1r6ictd&dl=1)

_Note that the ACAP will be non-responsive the initial 15-20 seconds when it is loading the model into the camera._

Integrate by monitoring the events from camera or have the camera send MQTT on the event.  

<br/>
![image](https://api.juhlin.me/image/hand)





