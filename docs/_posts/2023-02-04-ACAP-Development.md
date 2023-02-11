---
layout: post
title:  "Develop your own ACAP"
date: 2023-02-04 00:00:00 +0200
categories: [ACAP]
---
Do you want to develop your own service running in an Axis Camera?  ACAP stands for Axis Camera Application Platform.  It is similar to App development for a mobile phone but the difference is that while Apps are targeting users,  ACAP targets integrators. You find more information about ACAP on [Axis Developer Community](https://www.axis.com/developer-community/acap). 

In order to develop an ACAP you need to have basic understanding of C, HTML anf JavaScript.   On [Axis Github](https://github.com/AxisCommunications/acap3-examples) you can find some example ACAPs. The SDK may be challaning and the examples demonstrates a specific ACAP service.  However, they often lack a user interface and hard to use as a template for a project.  The examples I provided are well-suited as templates for many different kind of ACAPs. They all have user interfaces and includes all common services used in ACAP.

To get started you will need a Linux computer with [GIT](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker](https://docs.docker.com/engine/install/) installed.\
\
My [ACAP Example respository](https://github.com/pandosme/make_acap) includes examples with user interfaces that you can use as template to build your own service.

The examples are:
* Storing parameters
* Capture an JPEG Image
* Fire events
* Use motion tracking
* Use image classificatiom
* Send data on MQTT (using [SIMQTT](https://pandosme.github.io/acap/mqtt/2021/10/18/simqtt.html) as an MQTT client proxy).

To build exmple the image example, type the following

```
git clone https://github.com/pandosme/make_acap.git
cd make_acap
cd image
. make_all.sh
```
The SDK build environment container will be fetched on the first build and the source code will be compiled.  Once compiled, install the eap-file on your Axis device.  Once you got the sample ACAP running you can start experimenting and alter the source code under source.  You only need to to focus on main.c and html/index.html.  All files with CAPITOL letters are wrappers that hides the complex stuff.

