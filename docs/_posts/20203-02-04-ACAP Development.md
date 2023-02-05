---
layout: post
title:  "Develop your own ACAP"
date: 2023-02-04 00:00:00 +0200
categories: [ACAP]
---
Do you want to develop your own service running in an Axis Camera?  ACAP stands for Axis Camera Application Platform.  It is similar to App development for a mobile phone but the difference is that while Apps are targeting users,  ACAP targets integrators. You find more information about ACAP on [Axis Developer Community](https://www.axis.com/developer-community/acap). 

In order to develop an ACAP you need to have basic understanding of C, HTML anf JavaScript.   On [Axis Github](https://github.com/AxisCommunications/acap3-examples) you can find some example ACAPs. The SDK may challaning and there are a number of examples on [Axis Github](https://github.com/AxisCommunications/acap3-examples).  These exemplaes could be used as template but they only demonstrates a specific ACAP service.  They often lack a user interface.  In order to simplify for developers, I have provided common use cases templates/wrappers that demonstrates how to access service in ACAP like API/HTTP, parameters, image, motion tracking and object calssifications.  You are welcome to use these exemple ACAP as a base for your project.  They all have user interfaces and includes all common services used in ACAP.

To get started you will need a Linux computer with [GIT](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker](https://docs.docker.com/engine/install/) installed.  

The repository includes multiple ACAPs with user interfaces that you can use as template to build your own service.  The examples are:
* Storing parameters
* Capture an JPEG Image
* Fire events
* Use motion tracking
* Use image classificatiom
* Send data on MQTT (using [SIMQTT](https://pandosme.github.io/acap/mqtt/2021/10/18/simqtt.html) as an MQTT proxy.

To build an ACAP, all you need to do is

```
git clone https://github.com/pandosme/make_acap.git
cd make make_acap
cd image
. make_all.sh
```
The SDK build environment will be fetched on the first build and the source code will be compiled.  Once compiled, install the eap-file on your Axis device.  Once you got the sample ACAP running you can start experimenting and alter the source code under source.  You only need to to focus on main.c and html/index.html.  All files with CAPITOL letters are wrappers that hides the complex stuff.

