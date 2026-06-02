# Contributing

Thanks for contributing.

## Scope

This repository is a wrapper around upstream free-claude-code. Keep changes focused on:

- containerization and reproducibility
- onboarding and documentation
- wrapper scripts and CI

Avoid changing upstream internals directly in this repository.

## Development flow

1. Create a branch from `main`.
2. Make small, focused changes.
3. Run checks locally:

```bash
bash -n start.sh stop.sh verify.sh
./start.sh
./verify.sh
./stop.sh
```

4. Update docs/changelog when behavior changes.
5. Open a PR with clear before/after notes.

## Commit style

Prefer concise conventional-style summaries, for example:

- `feat: add verify script for health checks`
- `docs: clarify OpenRouter setup path`
- `ci: add docker smoke workflow`
