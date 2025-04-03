---
layout: post
title:  "Hand Gesture Detection"
date: 2024-09-13 00:00:00 +0200
categories: [ACAP]
---

Using the [DetecX ACAP Package](https://pandosme.github.io/acap/2024/09/04/Custom_Object_Detection_Models.html) and trainging on the [Hagrid Hand Gesture Dataset](https://github.com/hukenovs/hagrid) supporting 18 hand gesture, this ACAP can detect them all. This ACAP is developed for fun and inspiration.  I would love to hear what the uses cases may be and how to improve it.  

![gestures](https://raw.githubusercontent.com/hukenovs/hagrid/Hagrid_v1/images/gestures.jpg)

### Demonstration video
Sorry if the ACAP will obscure the hand gestures but you can still see what I am doing in the window.  
{% include youtube.html id="GYcOC71_BoM" %}

### [Download ACAP](https://www.dropbox.com/scl/fi/92rsm7zkqxlaqvxlfq038/HandGestures.zip?rlkey=ukyzhemobwgncuw2zi47099f6&st=y1r6ictd&dl=1)

_Note that the ACAP will be non-responsive the initial 15-20 seconds when it is loading the model into the camera._

Integrate by monitoring the events from camera or have the camera send MQTT on the event.  

<br/>
![image](https://api.juhlin.me/image/hand)
