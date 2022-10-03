---
layout: post
title:  "Installing Tailscale VPN client on Axis device"
date: 2020-01-02 00:00:00 +0200
categories: [ACAP]
---
[Tailscale](https://tailscale.com/) is a secure and easy VPN Solution.  A Tailscale client is required add a device to a Tailscale VPN.  
[How tailscale works](https://tailscale.com/blog/how-tailscale-works/)

## Prerequisite
- [Tailscale account](https://tailscale.com/)
- Axis device  
(Based on arm7hf or AARCH64)
- [Tailscale Installer ACAP](https://www.dropbox.com/s/rcg10via69gye1l/Tailscale_Installer_ACAP.zip?dl=1)

## Installing
1. Install the appropriate EAP file based on the device platform.  
2. Start the ACAP
3. Click open to see the output of the logs for further instructions.

## Updating Tailscale version

The eap files will be updated from time to time alternativly simply replace the files "tailscale" and "tailscaled" in the app directory with the new versions before building.
Make sure you use the files for the correct Soc.
Latest versions can be found at https://pkgs.tailscale.com/stable/#static





