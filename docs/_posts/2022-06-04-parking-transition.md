---
layout: post
title:  "Parking transition detection"
date: 2022-06-04 00:00:00 +0200
categories: [ACAP]
---
For a system that needs a simple way of detecting when a parking space becomes free or occupied.  Typically in a parking garage.

![Parking-image]({{ site.url }}/assets/parking_transition.jpeg)

## [Download Parking Transition](https://www.dropbox.com/s/gbkmcbvhm7jb6qr/Parking_Transition.zip?dl=1)

# Prerequisite
1. Axis camera 
2. Parking Transition ACAP

# Parking transition detector

## Installation
Install the ACAP in the downloaded zip-file
(Select appropriate eap-file that matches you Axis device platform)

## Configuration
For every parking space visible in the view...
1. Click the green Add button
2. Use mouse to move/resize the box to define a parking space.  The center of the vehicle must be within the box.
3. Set a name (id) for the parking space.  It is recommended not to use names with spaces. *Use the "My_Space_1" instead of "My Space 1"*
4. Save

To edit a parking space, click the space in the table below, make adjustments and click save.

## Validation
To verify correct behavior, each space will be marked red, green or yellow.
 Red means occupied, green means free and yellow means no transition has not been detected. 
 The table below shows the same information in text.


## Detection optimization
Some scenes may require adjustments to get a good behavior.  Select "Detection" from the menu.  
\
**Filter: Detection filter**  
To minimize possible false detection in some area, click the button "Set detection area" or "Set minimum size" and use mouse to adjust boxes.  
\
**Detection type**  
Select "Vehicle detection" to use object classification.  If [Axis License Plate verifier](https://www.axis.com/products/axis-license-plate-verifier) is installed on the camera you can use license plate as the detector.  The license plate number will be included in in the event.  
\
**Filter: Confidence level**  
If you notice false detection you could increase the minimum detection confidence level  
\
**Filter: Transition period**  
Moving vehicles or persons may block a parked vehicle for a short time and a transition event may occur.  Select longer transitions period to avoid this.  An event will not be fired until a space is free/occupied for the given time.  

# Integration

## MQTT
Configure the camera MQTT client or install [SIMQTT]({{ site.url }}/acap/mqtt/2021/10/18/simqtt.html).

### SIMQTT
Topic
```
simqtt/acap/parking/Space1/[true/false]
```
Payload
```
{
  "name":"If defined in SIMQTT",
  "location":"If defined in SIMQTT",
  "device":"ACCC8EXXXXXX",
  "timestamp":1644442759226,
  "spaceID":"Space1",
  "plate":"",
  "state":true
}
```

### Camera MQTT client
Configure MQTT and set up one MQTT publication for every parking space
```
axis/event/tns:axis/CameraApplicationPlatform/parking/Space1/$source/spaceID/Space1
{
  "topic": "axis:CameraApplicationPlatform/parking/Space1",
  "timestamp": 1644442759226,
  "message": {
    "source": {
      "spaceID": "Space1"
    },
    "key": {},
    "data": {
      "state": "0",
      "plate": ""
    }
  }
}
```


## ONVIF Events
For clients supporting ONVIF event stream, an event is fired on every transition.

<br/>
![image](https://api.aintegration.team/image/parking-transition)
