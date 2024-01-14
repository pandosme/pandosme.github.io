---
layout: post
title:  "Secure remote device access"
date: 2023-03-08 00:00:00 +0200
categories: [Security, ACAP]
---

In cases when you need access to a remote device such as a camera, there are several ways to do this.  One way is to expose the camera to Internet with a public IP address, often by poking a hole in the firewall.  Not a recommended option.  People do this when they do not know better and underestimate the risk with Internet-facing devices (even with a strong password and using HTTPS).  
A better solution is a VPN connection to a VPN server.  However, setting up a VPN server solution can be tricky and could get costly.
 \
 \
[Tailscale](https://tailscale.com/) is a VPN service that makes the devices and applications you own accessible anywhere in the world, securely and effortlessly. It enables encrypted point-to-point connections using the open source [WireGuard](https://www.wireguard.com/) protocol, which means only devices on your private network can communicate with each other.  I use Tailscale to gain access to my home network without exposing any ports or setting up a VPN server.  I can access my devices from my mobile phone and Laptops (as they all are running the Tailscale client).
 \
 \
 Read more on [Tailscale](https://tailscale.com/) how it works and how to create a free account to access up to 100 devices.\
 When you are done, install the [Tailscale Installer ACAP](https://github.com/Mo3he/Axis_Cam_Tailscale) (by Mo3he) on your Axis device.  
 \
_Note that I am not sponsered or endorsed by Tailscale, just pointing out a good remote access solution._

<br/>
![image](https://api.aintegration.team/image/tailscale)
