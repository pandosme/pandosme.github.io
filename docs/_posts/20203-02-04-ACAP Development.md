---
layout: post
title:  "Develop your own ACAP"
date: 2023-02-04 00:00:00 +0200
categories: [ACAP]
---
Do you want to develop your own service running in an Axis Camera?  ACAP stands for Axis Camera Application Platform.  It is similar to App development for a mobile phone but the difference is that while Apps are targeting users,  ACAP targets integrators.
In order to develop an ACAP you need to have basic understanding of C, HTML anf JavaScript.  You can find more information on [Axis Developer Community](https://www.axis.com/developer-community/acap).  On [Axis Github](https://github.com/AxisCommunications/acap3-examples) you can find some example ACAPs. The SDK can be somewat challaning.  While examples on [Axis Github](https://github.com/AxisCommunications/acap3-examples) demonstrates a specific service they may be challanging to build a useable service with a user interface.  In order to simplify for developers I have provided common use cases templates/wrappers that demonstrates how to access service in ACAP like API/HTTP, parameters, image, motion tracking and object calssifications.

To get started you will need a Linux computer with [GIT](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker](https://docs.docker.com/engine/install/) installed.

The repository include ACAPs demos with user interfaces that you can use as template to build your own service like
* Storing parameters
* Capture an JPEG Image
* Fire events
* Use motion tracking
* Use image calssificatiom
* Send data on MQTT

To build an ACAP, all you need to do is

```
git clone https://github.com/pandosme/make_acap.git
cd make make_acap
cd iamge
. make_all.sh
```
Install the eap-file on your Axis device

Once you got the sample ACAP running you can alter athe source code under source.  You only need to to focus on main.c and html/index.html.

