---
layout: post
title: "DetectX: PPE"
date: 2025-10-28 00:00:00 +0200
categories: [ACAP]
---

# DetectX PPE

DetectX PPE helps ensure compliance with personal protective equipment (PPE) requirements by detecting **hardhats, masks, vests**, and identifying missing safety gear in high-risk environments.  
The main purpose is actually to detect when people are not wearing Hardhat, Vest or mask so the ACAP also detects **NO_ Hardhat, NO_Vest and NO_Mask**.


This ACAP application builds on the [DetectX base model](https://github.com/pandosme/DetectX), trained on **25,000 images** across multiple scenarios and lighting conditions, using a custom object detection model derived from a number of public PPE Datasets.  

On detection the ACAP will fire an event, send MQTT message with bounding boxes or send a cropped image of the detection to an HTTP endpoint or an MQTT broker.

![Example]({{ site.url }}/assets/ppe_demo.png)

### [Download DetectX PPE](Download PPE.zip)

---

## Labels and Detections

Detection of each label can be individually toggled on or off:

- Hardhat  
- Mask  
- Vest  
- NO_Hardhat  
- NO_Mask  
- NO_Vest  
- Person  

---

# User & Integration Guide

## Camera Setup

1. Mount the camera in a high, stable position, ensuring it covers the operational area clearly.  
2. Consult the camera’s user manual to configure hardware and image settings for your environment.  
3. Install **DetectX PPE** into the camera through AXIS Device Manager or the camera’s web interface.  

---

## Usage

Please read [DetectX: COCO](https://github.com/pandosme/DetectX) for usage and integration.

---

## Model Overview

**Dataset:** WIDER-FACE (optimized for human face detection)  
**Label:** Face  

**Supported Platforms:**

| Platform  | Model Input | Model Size |
|------------|-------------|-------------|
| ARTPEC-8   | 960         | Small       |
| ARTPEC-9   | 1440        | Small      |
| ARTPEC-9Plus   | 1440        | Medium      |

*Note:* ARTPEC-9 offers enhanced inference performance and supports larger model inputs for improved accuracy.

---
![image](https://api.juhlin.me/image/ppe)
