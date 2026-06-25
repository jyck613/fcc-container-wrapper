# Provenance

## Upstream

- Repository: https://github.com/Alishahryar1/free-claude-code
- License: MIT

## Wrapper scope

This project provides operational packaging around upstream:

- pinned upstream source ref
- container runtime scripts
- setup/use docs
- CI smoke checks

## Default upstream pin

- `d281d52ced3ae39e853b524074d4230def518ed5`

## How to update upstream pin

Run with new build args:

```bash
UPSTREAM_REF=<new-commit-or-tag> ./start.sh
```

Then validate with:

```bash
./verify.sh
```

and update release notes/changelog accordingly.
