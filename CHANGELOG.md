# Changelog

All notable changes to this wrapper project will be documented in this file.

The format follows Keep a Changelog and Semantic Versioning.

## [Unreleased]

### Added
- Pinned-upstream Docker build with `UPSTREAM_REPO` and `UPSTREAM_REF` build args.
- Wrapper scripts: `start.sh`, `stop.sh`, and `verify.sh` for standard lifecycle.
- Public-facing docs for install, setup, use, and architecture rationale.
- `.env.container.example` for safe configuration onboarding.
- Baseline open-source governance files and CI workflow.

### Changed
- Bumped default `UPSTREAM_REF` from `9a2c5fbeb90c79cd0139a4044e05fee7d1ba056a` to `d281d52ced3ae39e853b524074d4230def518ed5`.

## [0.1.0] - 2026-06-01

### Added
- Initial public wrapper release.
- Reproducible containerized runtime around upstream free-claude-code.
- Host-side Claude CLI proxy integration guidance.
