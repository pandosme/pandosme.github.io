---
layout: post
title: "Unofficial ACAP Developers"
date: 2026-09-06
categories: [ACAP]
excerpt: "Axis staff, independent developers and small companies building ACAPs for Axis cameras outside the official SDK examples."
image: /assets/unofficial-acap-developers-banner.png
---

DetectX has been forked once (HeavyX) and now has at least one direct commercial competitor (MLSensor). That was reason enough to find out who else is actually building ACAPs, beyond the official examples Axis publishes itself.

**What**: a list of people and organisations who publish ACAPs and ACAP tooling — open source or self-supported — outside Axis's own official repos.

**Who it's for**: anyone building on ACAP who wants to know what already exists before writing it again, or who is looking for other developers working the same ground.

**Why**: this corner of the ecosystem has no directory of its own. The closest thing is the community-run [awesome-acap](https://github.com/apljungquist/awesome-acap) list, which indexes repos but not people.

**Where**: sourced from GitHub repository search (topic `acap`, and text search for "acap axis camera"), the awesome-acap index, and the Axis GitHub organisation.

**When**: a snapshot from September 2026. GitHub's rate limits blocked pulling profile details for individual developers, so people are identified by handle and repo content only — this is a starting point, not a census. If you build ACAPs and don't see yourself here, let me know.

---

## Axis staff, publishing unofficially

Axis employees who publish ACAPs and tooling on personal GitHub accounts, with a not-supported-by-Axis disclaimer. Between them, this small group produces most of the community ACAPs that actually get installed and forked — including this site's own.

- **Fred Juhlin — [pandosme](https://github.com/pandosme)** (2020–). That's me. DetectX family (PPE, Face, Inference Hub), Timelapse 2/3, Voice-Transcript, DataQ, videox, HandGesture, SVG Overlay, Node-RED Installer, AI-B100, make_acap, plus Node-RED nodes and recipes.
- **Weston Blieden — [Mo3he](https://github.com/Mo3he)** (2023–). VPN clients for the camera (Tailscale, WireGuard, ZeroTier, NetBird, OpenVPN), go2rtc, MediaMTX, ffmpeg builds, an Event Engine, Axis-Whisper (on-device speech-to-text), an InfluxDB collector.
- **Dave Nicholl — [mrdnlabs](https://github.com/mrdnlabs)** (2026–). HeavyX, a DetectX fork; an AOA counter/tailgating/dwell/occupancy suite; axperf, a lines overlay, an SD-card reader, audio extensions, and an AAMP scheduler — 14 repos in total.
- **Joakim Roubert — [joakimr-axis](https://github.com/joakimr-axis) (official org) / [d97jro](https://github.com/d97jro) (personal)** (2022–). An OPC UA suite and ptpd2 under the AxisCommunications org; findwind-acap, a weather overlay, on the personal account.
- **Vivek Kumar — [vivekatoffice](https://github.com/vivekatoffice)** (2022–). Support_ACAP, and active support on GitHub Discussions — Most Helpful Contributor 2023.
- **Mikael Berglund — [smicker](https://github.com/smicker)** (2021). axis_acap_hello_world, a minimal starter template.

## Independent developers

Not affiliated with Axis, ordered roughly by how active the account currently is.

- **[apljungquist](https://github.com/apljungquist)** — maintains awesome-acap itself, plus rs4acap tooling and the easy-acap Rust framework. High activity; rs4acap was updated August 2026.
- **[Cacsjep](https://github.com/Cacsjep)** — goxis, Go wrappers for the ACAP native SDK, goxisbuilder, goxis_examples, and a "Missing Features" ACAP doc.
- **[trunnion](https://github.com/trunnion)** — cargo-acap, a Rust build tool for ACAP, a Rust VAPIX client, and the axctl CLI.
- **[ErikMN](https://github.com/ErikMN)** — acap_doom (Doom, running on a camera) and widget_wizard, an in-stream overlay-widget frontend.
- **[daniel-falk](https://github.com/daniel-falk)** (FixedIT.ai) — Axis-ACAP-guides and python-app-on-axis-camera.
- **[jrutanen](https://github.com/jrutanen)** — acap-mcp-server, an MCP server running on the camera itself.
- **[oneshot2001](https://github.com/oneshot2001)** — a second axctl CLI, and autoacap, AI-driven ACAP optimisation.
- **Pavel Kotyza — [kotyzap](https://github.com/kotyzap)** (CamStreamer, BDM) — AXIS-Camera-MCP-Server, the first on-camera MCP server (252 tools), Warehouse-Manager-for-Axis, a Gender/Age Detection ACAP, alongside CamStreamer's commercial product line.
- **[tris](https://github.com/tris)** — axis-weatherflow, a weather overlay.
- **[karlcswanson](https://github.com/karlcswanson)** — netbird-acap.
- **[imnotjames](https://github.com/imnotjames)** — axis-acap-metrics, pushing camera metrics out.
- **[hakanardo](https://github.com/hakanardo)** — vi3o, a video utility with Axis timestamp support.
- **[drcoble](https://github.com/drcoble)** — Camera_Schedule, solar/lunar/seasonal triggers.
- **[ArcusD](https://github.com/ArcusD)** — Spotify-ACAP (work in progress).
- **[RzuBD](https://github.com/RzuBD)** — a people counter in C++ against the Native SDK.
- **[fishloa](https://github.com/fishloa)** — axis-origin, an LL-HLS/DASH origin running on the camera.
- **[gscarlet22-design](https://github.com/gscarlet22-design)** — Weather-ACAP, a weather-alert radio.

## Organisations publishing open-source ACAP code

- **[FixedIT.ai](https://github.com/fixedit-ai)** — Axis-ACAP-guides, fixedit-data-agent-examples, a YOLOv5 ACAP fork. Also runs a commercial edge runtime and is an Axis technology partner.
- **[NovaltaLabs](https://github.com/NovaltaLabs)** — BirdNET-acap, bird audio classification running on the camera.
- **everstra.com ([NFDiJee](https://github.com/NFDiJee))** — axis-stream-tools, a free streaming and overlay suite, now maintained at everstra.com.

---

A few things stood out putting this together. The Rust tooling — acap-rs, cargo-acap, rs4acap, easy-acap — is now mature enough that Rust is a genuinely viable language for a new ACAP, not just C. Two people are running MCP servers directly on the camera (kotyzap and jrutanen), which says something about where people expect on-camera compute to go next. And DetectX turns out to be an upstream now, not just an endpoint — HeavyX forked it, and MLSensor solves the same "bring your own model" problem commercially.

This list will be wrong the moment someone new pushes a repo. If that's you, or you know of one missing, [open an issue](https://github.com/pandosme/pandosme.github.io/issues) or reach out.

![image](https://api.juhlin.me/image/unofficial-acap-devs)
