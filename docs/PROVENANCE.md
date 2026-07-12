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

## Container image

The runtime image is produced by a multi-stage `Dockerfile`:

- a builder stage clones the pinned upstream source and resolves runtime
  dependencies with `uv sync --frozen --no-dev`
- the final stage carries only Python plus the prepared app and virtualenv,
  omitting `git`, `curl`, `uv`, dev dependencies, and upstream `.git` history

This keeps the runtime image at roughly 244 MB.

## Default upstream pin

- `e37b50463698a150cb7fa7ee394cae7f3aee7f3e`

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
