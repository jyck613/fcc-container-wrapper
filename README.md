<h1 align="center">🐳 FCC Container Wrapper ⚡</h1>




[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Release](https://img.shields.io/github/v/release/jyck613/fcc-container-wrapper?display_name=tag)](https://github.com/jyck613/fcc-container-wrapper/releases)
[![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?logo=docker&logoColor=white)](Dockerfile)


[Quick Start](#install) · [Development](#release-strategy)




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
  place.




## What it does




- builds a local Docker image from a pinned upstream commit
- runs `fcc-server` at `http://127.0.0.1:18082`
- supports provider routing via `.env.container` (OpenRouter, NIM, Ollama, etc.)
- provides health and auth verification with one command




## Why this architecture




- **Reproducibility**: image build is pinned to a known upstream ref
- **Isolation**: host Node/Claude workflow stays separate from Python runtime
- **Operational clarity**: explicit start, stop, and verify scripts
- **Safer publishing**: wrapper can evolve independently from upstream internals
