# Changelog

All notable changes to this wrapper project will be documented in this file.

The format follows Keep a Changelog and Semantic Versioning.

## [Unreleased]

### Changed
- Reworked the container build into a multi-stage `Dockerfile`, shrinking the
  runtime image from ~545 MB to ~244 MB. Build tooling (`git`, `curl`, `uv`) is
  now confined to a builder stage, runtime dependencies are installed without the
  dev group (`uv sync --no-dev`), the base image's system Python is reused instead
  of downloading a managed interpreter, and the duplicate source copy plus cloned
  `.git` history are dropped from the final image.

## [0.1.1] - 2026-06-24

### Changed
- Bumped default `UPSTREAM_REF` from `9a2c5fbeb90c79cd0139a4044e05fee7d1ba056a` to `a0f62c598ca087107cabb14c65adf980ed71143d`.

## [0.1.0] - 2026-06-01

### Added
- Initial public wrapper release.
- Reproducible containerized runtime around upstream free-claude-code.
- Host-side Claude CLI proxy integration guidance.
