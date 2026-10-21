---
layout: post
title: "Voice Command on Axis Devices"
date: 2026-07-09
categories: [ACAP]
excerpt: "Use an Axis device as a voice command input: detect speech locally, recognize short commands externally, and publish keyword matches over MQTT."
image: /assets/voice-transcript.png
---

**Voice Command** turns an Axis device with a microphone into a voice command input for your automations. It is designed to recognize short spoken commands and publish matching commands over MQTT—not to provide general-purpose or long-form transcription.

## How it works

- The ACAP captures audio from the Axis device's microphone and uses Silero VAD on-device to detect and segment speech.
- Speech-qualified utterances are sent to an external Wyoming Whisper server for recognition. Whisper does not run on the camera.
- The app checks recognized text against your configured command keywords. Only matching commands are published to MQTT.
- Non-matching or otherwise rejected candidates can be reviewed in the app's command history for troubleshooting; there is no general-transcription MQTT stream.

This lets an Axis device act as a dedicated voice command input without requiring a separate wakeword. You configure the words or phrases that should trigger your automations.

## Requirements

- An Axis device with a working microphone and AXIS OS 12 or 13.
- A reachable external Wyoming Whisper server. The camera performs speech detection, not speech recognition.
- An MQTT broker and at least one configured command keyword to publish commands.

The ACAP supports **aarch64** and **armv7hf** devices. Both architectures require the external recognition server; the device runs speech detection locally.

## MQTT integration

Only keyword-matching commands are published to `voice/command` (or `<preTopic>/voice/command` when a prefix is configured). A command includes the recognized text, language, timestamp, detected keyword matches, and device metadata such as serial number, name, and location when configured. Connect an MQTT client or home automation platform to this topic to act on commands.

The app also includes a microphone calibration test to help check audio input and tune speech-detection settings. It does not change the device's microphone gain automatically.

## Get Voice Command

- **[Voice Command — source on GitHub](https://github.com/pandosme/Voice-Command)**, open source. Pull requests welcome.
- **[Download pre-compiled ACAP](https://www.dropbox.com/scl/fi/luhpyx3hlf782hc5sqytw/Voice-Command.zip?rlkey=2xzdsypd4qw03t1hsy0xzrgfn&st=gawa85br&dl=1)** if you just want to install it.

If this is useful, consider [buying me a coffee](https://buymeacoffee.com/fredjuhlinl).

![image](https://api.juhlin.me/image/voice-transcript)
