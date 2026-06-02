<h1 align="center">🐳 FCC Container Wrapper ⚡</h1>

<p align="center">
  <a href="LICENSE"><img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-green.svg"></a>
  <a href="https://github.com/jyck613/fcc-container-wrapper/releases"><img alt="Release" src="https://img.shields.io/github/v/release/jyck613/fcc-container-wrapper?display_name=tag"></a>
  <a href="Dockerfile"><img alt="Docker" src="https://img.shields.io/badge/Docker-Ready-2496ED?logo=docker&amp;logoColor=white"></a>
</p>

<p align="center">
  <a href="#install">Quick Start</a> · <a href="#release-strategy">Development</a>
</p>

Production-style container wrapper around
[Alishahryar1/free-claude-code](https://github.com/Alishahryar1/free-claude-code),
with pinned upstream builds, reproducible local startup, and clean host-side
Claude CLI integration.
















## Why this exists
















The upstream project is excellent, but teams often need a more predictable local
runtime story:
















- isolate dependencies from host Python and package state
- pin upstream source ref for reproducible builds
- keep startup, verify, and shutdown as simple scripts
- make rollback and troubleshooting obvious
















## Where this is forked from
















- Upstream repository:
  https://github.com/Alishahryar1/free-claude-code
- Wrapper build pin (default):
  `9a2c5fbeb90c79cd0139a4044e05fee7d1ba056a`
- This repo wraps upstream runtime behavior and does not modify upstream code in
