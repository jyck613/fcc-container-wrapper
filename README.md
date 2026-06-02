<h1 align="center">ð³ FCC Container Wrapper â¡</h1>

<p align="center">
	<a href="LICENSE"><img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-green.svg"></a>
	<a href="https://github.com/jyck613/fcc-container-wrapper/releases"><img alt="Release" src="https://img.shields.io/github/v/release/jyck613/fcc-container-wrapper?display_name=tag"></a>
	<a href="Dockerfile"><img alt="Docker" src="https://img.shields.io/badge/Docker-Ready-2496ED?logo=docker&amp;logoColor=white"></a>
</p>

<p align="center">
	<a href="#install">Quick Start</a> Â· <a href="#release-strategy">Development</a>
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

## Install

### Prerequisites

- Docker Engine (with daemon running)
- Bash shell

### Clone

```bash
git clone https://github.com/<your-org-or-user>/fcc-container-wrapper.git
cd fcc-container-wrapper
```

## Setup

1. Create runtime env file:

```bash
cp .env.container.example .env.container
```

2. Edit provider settings in `.env.container`:

- set `OPENROUTER_API_KEY` or other provider credential
- choose model in `MODEL`
- keep `ANTHROPIC_AUTH_TOKEN` for local proxy auth

## Use

### Start

```bash
./start.sh
```

### Verify

```bash
./verify.sh
```

Expected healthy response:

```json
{"status":"ok","provider":"open_router","model":"open_router/..."}
```

### Stop

```bash
./stop.sh
```

## Claude CLI (host-side)

Run Claude CLI on host and point it at this local proxy:

```bash
export ANTHROPIC_BASE_URL=http://127.0.0.1:18082
export ANTHROPIC_AUTH_TOKEN=freecc
claude
```

## Upstream pin management

Override upstream source and ref at build time:

```bash
UPSTREAM_REPO=https://github.com/Alishahryar1/free-claude-code.git \
UPSTREAM_REF=<commit-or-tag> \
./start.sh
```

## Release strategy

- SemVer tags for wrapper: `v0.1.0`, `v0.2.0`, ...
- release notes include upstream ref, changes, and migration notes
- no secrets in repo; use `.env.container.example` only

## Folder structure

```text
fcc-container-wrapper/
|- Dockerfile
|- docker-compose.yml
|- start.sh
|- stop.sh
|- verify.sh
|- .env.container.example
|- docs/
|  |- ARCHITECTURE.md
|  |- PROVENANCE.md
|  |- RELEASE.md
|- README.md
|- CHANGELOG.md
|- SECURITY.md
|- CONTRIBUTING.md
```
