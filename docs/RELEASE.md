# Release Process

## Versioning

Use SemVer for wrapper releases:

- `v0.1.1` latest wrapper release
- `v0.2.0` backward-compatible feature updates
- `v1.0.0` stable release baseline

## Pre-release checklist

1. Ensure no secrets are committed.
2. Run local checks:

```bash
bash -n start.sh stop.sh verify.sh
./start.sh
./verify.sh
./stop.sh
```

3. Update `CHANGELOG.md`.
4. Confirm README and docs reflect current behavior.

## Tag and release

```bash
git tag -a v0.1.1 -m "Release upstream pin refresh"
git push origin v0.1.1
```

Create GitHub Release notes including:

- upstream repository and pinned ref
- major wrapper changes
- install/setup/use quick links
- known limitations and migration notes
