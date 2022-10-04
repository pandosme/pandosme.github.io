---
layout: post
title:  "Object path capture"
date: 2022-10-04 00:00:00 +0200
categories: [ACAP, MQTT, Component]
---
ObjectPath is an MQTT client that installs in Axis camera to capture an object path through a scene.  It utilizes the video analyctics in the camera.  
Examples of use cases:
* Heatmap visualization
* Forensic search
* Counting

![image]({{ site.url }}/assets/objectpath.jpg)

# Prerequisite
1. Axis camera  
2. [ObjectPath](https://api.aintegration.team/acap/objectpath?source=pages) ACAP
3. Access to MQTT broker
4. A system with an MQTT client that consumes the data for some use case

# Validation
The configuration page displays the 15 most recent detections visually augement over video and in a table.

# Settings

## Detection filter
Detected objects must comply to all the filters to be published.
![image]({{ site.url }}/assets/objectpath-filter.jpg)
/
**View and Set area object must pass**  
Defines the area that the object must pass while moving through the scene.  The point on the object (center-of-gravity) that must pass depends on the Camera Placement setting.  See Camera placement.   
For Ceiling is is the center of the object.  Click the button and use mouse to define the area
/
**Minimum distance**
Set how long the total movement distance must be to be published in percent of the view.
/
**Minimum distance**
Set how long the object must be in scene.
/
**Object type**
Use with caution as the quility of object classification depends on the scene.  It is only recommended to apply this filter after a day of capturing has been analyzed.
/
**Camera placement**
Defince the center-of-gravity of the object that is used when checing if the object is passing the area-of-interest while moving in the scene.
Wall mounted cameras that result in a view with perspective the optimal center-of-gravity is bottom-center (the feet on a person)
Ceiling mounted cameras will place center of gravity in the middle-center of the object.


## MQTT Settings
![image]({{ site.url }}/assets/objectpath-mqtt.jpg)

# Integration

When an object leaves the te scens (or when lost by the tracker), a message is published. 
The payload includes:
* name: User defined name
* info: Additional user defined information (e.g. location)
* device: Device serial number
* id: Object tracker ID
* timestamp: EPOCH time
* dx: Total distance moved X-axis (birth-death)
* dy: Total distance moved Y-axis (birth-death)
* age: Seconds in scene
* distance: Total distance moved in scene
* path: Array of motiotn points in scene
* classes: Obejct classfication hits
* type: Objcect flassification type

Coordinate system is realtive [0,0] - [1000,1000] regardless of image aspect ration.  Origo is top-left corner of image.

Example Topic & Payload
```
objectpath/detection/B8A44F123456
{
  "name": "Camera 1",
  "info": "Showroom",
  "device": "B8A44F123456",
  "id": 6700,
  "timestamp": 1664889737367,
  "dx": 209,
  "dy": 4,
  "age": 266.6,
  "distance": 53.3,
  "path": [
    { "x": 290, "y": 789 },
    { "x": 333, "y": 762 },
    { "x": 400, "y": 762 },
    { "x": 452, "y": 760 },
    { "x": 501, "y": 770 },
    { "x": 553, "y": 772 },
    { "x": 572, "y": 819 },
    { "x": 530, "y": 848 },
    { "x": 502, "y": 804 },
    { "x": 554, "y": 798 },
    { "x": 499, "y": 793 }
  ],
  "type": "Person"
}
```
