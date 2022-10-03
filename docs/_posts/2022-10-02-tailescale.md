---
layout: post
title:  "Add Axis device to Tailscale VPN"
date: 2020-01-02 00:00:00 +0200
category: ACAP
---
[Tailscale](https://tailscale.com/) is a secure and easy VPN Solution.  A Tailscale client is required add a device to a Tailscale VPN.  
[How tailscale works](https://tailscale.com/blog/how-tailscale-works/)

## Installing

The recommended way to install this ACAP is to use the pre built eap file in the build diretory.

It's also possible to build and use a locally built image as all necesary files are provided.

## Using the Tailscale ACAP

The Tailscale ACAP will run a script on startup that will copy a service file to systemd, set required permissions and start the service and app.
Once started click open to see the output of the logs for further instructions.

When uninstalling the ACAP, all changes and files are removed from the camera.

You will need a tailscale.com account to use the ACAP

## Updating Tailscale version

The eap files will be updated from time to time alternativly simply replace the files "tailscale" and "tailscaled" in the app directory with the new versions before building.
Make sure you use the files for the correct Soc.
Latest versions can be found at https://pkgs.tailscale.com/stable/#static





