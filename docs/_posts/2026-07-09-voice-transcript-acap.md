---
layout: post
title: "Voice Command & Transcripts on Axis Devices"
date: 2026-07-09
categories: [ACAP]
excerpt: "Continuous voice transcription on Axis cameras, turning keyword phrases into MQTT commands with no wakeword needed."
---

**Voice Transcripts** is an ACAP that turns an Axis camera, a speaker, and a connectivity hub into a voice command and transcription input for other systems.

**Primary use case:** voice command — trigger automations by speaking a defined keyword phrase.

**Second use case:** continuous logging — publish every transcript to a database so spoken activity becomes searchable and queryable after the fact.

## Why no wakeword

The device transcribes audio continuously, so there's no "Hey ..." wakeword to say first. You define the keyword(s) you care about, and the ACAP picks out the transcript segments where they occur and publishes those for processing. I use this to control my home automation — it replaced wakeword-based voice inputs with always-on transcription from Axis devices.

This fits the same idea behind [Hand Gesture Detection](/acap/2024/09/13/Hand-Gestures.html): interacting with a system without touching a physical object.

## Features

- **Transcript review in the GUI** — every transcript is listed on-device so you can review and validate them, not just trust a black box.
- **Audio calibration** — tune input levels for the room/mic setup instead of guessing.

## Where transcription runs

- **On-device** — no external dependency, ~4-5 second latency.
- **External Wyoming/Whisper server** on the local network — ~250-300ms latency.

Pick whichever fits your latency and hardware budget.

Runs on **aarch64** and **armv7hf** Axis devices. On-device transcription requires aarch64 — on **armv7hf** you must use an external Wyoming/Whisper server.

## Integration

Transcripts and keyword matches are published over **MQTT** — easy to build a client against, whatever automation platform you use. Each payload carries:

- `text` — the transcript
- `language`
- `timestamp`
- `device name`, `location`, `serial number` — so a payload is traceable back to the exact device it came from

## Get it

- **[Voice-Transcript — source on GitHub](https://github.com/pandosme/Voice-Transcript)**, open source and usable as a base for custom voice components. Pull requests welcome.
- **[Download pre-compiled ACAP](https://www.dropbox.com/scl/fi/6aoh0o3g02gihm8w3rgt2/Voice-Transcripts.zip?rlkey=wfelmaiz3umyr4ae7lf6zgtb4&dl=1)** if you just want to install it.

If this is useful, consider [buying me a coffee](https://buymeacoffee.com/fredjuhlinl).

![image](https://api.juhlin.me/image/voice-transcript)
