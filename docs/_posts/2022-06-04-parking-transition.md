---
layout: post
title:  "Parking transition detection"
date: 2022-06-04 00:00:00 +0200
categories: [ACAP, MQTT]
---
For a system that needs a simple way of detecting when a parking space becomes free or occupiend.  Typically in a parking garage.

![Parking-image]({{ site.url }}/assets/parking_transition.jpeg)

## Prerequisite
- Axis camera 
- [Parking Transition](https://files.juhlin.me/acap/Parking?source=pages) ACAP
- MQTT client or ONVIF event stream client

## Parking transition detector

### Installation
Install the ACAP in the downloaded zip-file
(Selectect the eap-file that matches the cameras platform)
### Configuration
For every parking space visiable in the view...
1. Click the green Add button
2. Use mouse mouse to move/resize the the box to define a parking space.  The center of the vehicle must be within the box.
3. Set a name (id) for the parking space.  It is recommeded not to use names with spaces. *Use the "My_Space_1" instead of "My Space 1"*
4. Save

To edit a parking space, click the space in the table below, make adjustments and click save.

### Validation
To verify correct behaviour, each space will be marked red, green or yellow.
 Red means occupied, green means free and yellow means no transition has not been detected. 
 The table below shows the same information in text.

### Detection optimization
Some scenes may require adjustments to get a good behaviour.  Select "Detection" from the menu.  
\
**Filter: Detection filter**  
To minimize possible false detection in some area, click the button "Set detection area" or "Set minumum size" and use mouse to adjust boxes.  
\
**Detection type**  
Select "Vehicle detection" to use object classification.  If [Axis License Plate verifier](https://www.axis.com/products/axis-license-plate-verifier) is installed on the camera you can use license plate as the detector.  The license plate number will be included in in the event.  
\
**Filter: Confidence level**  
If you notice false detection you could increase the minimum detection confidence level  
\
**Filter: Transition period**  
Moving vehicles or persons may block a parked vehicle for a short time and a transition event may occure.  Select longer transitions period to avoid this.  An event will not be fired until a space is free/occupied for the given time.  
