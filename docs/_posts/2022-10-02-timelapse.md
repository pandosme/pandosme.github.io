---
layout: post
title:  "Timelapse video for Axis Cameras"
---
Using a network camera for creating timelpase videos is easy.  The most common use case is recording a construction site progress.  Other common use cases are monitor seasonal chhanges in your back yard or as a quick forensic search video when images are captured on motion detection rather them time.

## Prerequisite
- Axis camera with a mounted SD Card
- Timelapse Me ACAP

### [Download Timelapse ME ACAP](https://api.aintegration.team/acap/timelapseme?source=github)
*Supported platforms: MIPS, ARMv7hf, AARCH64*

## Creating Timelapse
![Settings]({{ site.url }}/assets/timelapse.jpg)

You can have a number of simultaneous timelpase recordings at the same time.  Note that at least three images needs to be in a recording  before the recording is show in the recording list.

1. Click "Add Timelapse"
2. Give the recording a descriptive name
3. Select Storage device (SD Card or Network Share).  They need to be mounted before starting Timelapse Me.
4. Select the event that will trigger image capture.  Note that timers or sun events needs to be configured before shown in the Event Select list whan adding timelapse.
5. Select aspect ration and resolution.  Resolution cannot be changed after recording started.  Large resolutions will generate very large recording files.
6. Select the Playback FPS.  Playback can be changed after recording started.
7. Set light conditions Light conditions to only capture images when sun is up.
8. Click Save

## Recordings 
Shows all active recordings

## Archives
In order to reduce the risk of filling up storage, recordings should be automaticially archived with a retention period.
The retention period gives you time to download recording before it is automatically removed.
Archiving frequency should be defined by how often images are captured.  A recording triggered by an image every minute should be archived daily.
Images capture once per day should be archived between 6-12 months.

## Inspect
Select a recording and inspect captured images.

## Timers
A convinient way of adding user-defined timers.  An alternative way is to add these timers in the cameras user interface.

## Geolocation
Setting the cameras Geolocation makes it possible to trigger on Sun Noon.  It also enables a way to filter image capture between dawn-dusk or sunrise-sunset.
