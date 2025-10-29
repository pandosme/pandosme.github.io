---
layout: post
title: "DetectX: PPE"
date: 2025-10-28 00:00:00 +0200
categories: [ACAP]
---

# DetectX PPE

DetectX PPE helps ensure compliance with personal protective equipment (PPE) requirements by detecting **hardhats, masks, and vests**, as well as identifying missing safety gear in high-risk environments.  
The primary purpose is to detect when people are **not** wearing a hardhat, vest, or mask, so the ACAP also detects **NO_Hardhat, NO_Vest, and NO_Mask**.

This ACAP application builds on the [DetectX base model](https://github.com/pandosme/DetectX), trained on **25,000 images** across multiple scenarios and lighting conditions, using a custom object detection model derived from several public PPE datasets.

Upon detection, the ACAP can trigger an event, send an MQTT message with bounding box data, or upload a cropped detection image to an HTTP endpoint or MQTT broker.

![Example]({{ site.url }}/assets/ppe_demo.png)

### [Download DetectX PPE](Download%20PPE.zip)

---

## Labels and Detections

Each detection label can be individually toggled on or off:

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

1. Mount the camera in a high, stable position, ensuring it clearly covers the operational area.  
2. Refer to the camera’s user manual to configure hardware and image settings according to the environment.  
3. Install **DetectX PPE** onto the camera using AXIS Device Manager or the camera’s web interface.  

---

## Usage

Refer to [DetectX: COCO](https://github.com/pandosme/DetectX) for usage and integration details.

---

## Model Overview

**Dataset:** WIDER-FACE (optimized for human face detection)  
**Label:** Face  

**Supported Platforms:**

| Platform    | Model Input | Model Size |
|-------------|-------------|-------------|
| ARTPEC-8    | 960         | Small       |
| ARTPEC-9    | 1440        | Small       |
| ARTPEC-9Plus| 1440        | Medium      |

*Note:* ARTPEC-9 provides enhanced inference performance and supports larger model inputs for improved accuracy.

---

![image](https://api.juhlin.me/image/ppe)
