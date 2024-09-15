---
layout: post
title:  "Custom Object Detection ACAP (Using YOLO5)"
date: 2024-09-05 00:00:00 +0200
categories: [ACAP]
---

While Axis cameras offer robust built-in object detection analytics for common use cases, some scenarios require more specialized detection. This package allows you to leverage a trained YOLOv5 model on the camera itself, bypassing the need for server-based processing.
If you have a labeld dataset, you can train a YOLO5 model, export it and create an ACAP to run it in the camera.

*Note that this will require time, effort and some skills.* 

### [GitHub repository](https://github.com/pandosme/DetectX)
<br>

## Running and configuring the ACAP
Install the EAP in your Camera.

### Detections
![Detections](https://raw.githubusercontent.com/pandosme/DetectX/main/pictures/detections.png)
Here is where you validate the detections and filter Arae-Of-Intrest and minimum confidence level.  
You will see the last 10 dections in both video and the table to the right.  

**Area-of-Intrest**
![Detections](https://raw.githubusercontent.com/pandosme/DetectX/main/pictures/aoi.png)
Press the button "Set Area of Intrest" and it turns blue.  Use the mouse to adjust the area.  End with pressing the button again so it turns gray.  

### Advanced
![Detections](https://raw.githubusercontent.com/pandosme/DetectX/main/pictures/aoi.png)
If you have an SD Card you can capture and store detection images and detection data.  This is primarily useful when debuggin a model or capturing additional images for your dataset.
Images are stored under /var/spool/storage/SD_DISK/DetecX.  There is a file called detections.txt that holds the detection data.  
To get these images, enable SSH on the camera and use a SFTP client to grab them.
*Note that leaving this on for a long time may quickly exhaust the SD Card.  
<br>
The minimum event state controls how long the event for each detected label should be.  The event will stay high until X seconds passed from the last detection.

![Detections](https://raw.githubusercontent.com/pandosme/DetectX/main/pictures/labels.png)  
You can enable and disable labels if they cause false detections.

### About
![Detections](https://raw.githubusercontent.com/pandosme/DetectX/main/pictures/about.png)  
Information about the ACAP and the Model.  The "Avg inference" is continously updated.  A value of e.g. 150 ms means that apprx 6-7 images are processed per second.

## Integrating with the ACAP
You can use the cameras Event/Action to trigger various actions.  Look for "DetectX: State change".  The event includes a state and a label.  
Instead of using Events/Actions it may be more useful and easier to configure MQTT publishing upon the event.  You MQTT client will get a payload with label and state.

![image](https://api.aintegration.team/image/yolo5)
