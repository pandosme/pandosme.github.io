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

### [Download DetectX PPE](https://www.dropbox.com/scl/fi/4xepl6iq9bzifi5uuf68a/PPE.zip?rlkey=on4ckeqys327lfcdl58xoofwk&dl=1)

*Note that the start up time before the ACAP gets responsive may take up to 30-55 (it is loading the model into the memory).*

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

Refer to [DetectX: COCO](https://github.com/pandosme/DetectX) for usage and integration details.

---

## Model Overview

**Dataset:** Trained on a number of public PPE datasets 
**Supported Platforms:**

| Platform    | Model Input | Model Size |
|-------------|-------------|-------------|
| ARTPEC-8    | 960         | Small       |
| ARTPEC-9    | 1440        | Small       |
| ARTPEC-9Plus| 1440        | Medium      |

*Note:* ARTPEC-9 provides enhanced inference performance and supports larger model inputs for improved accuracy.

---

![image](https://api.juhlin.me/image/ppe)
