# Architecture

## High-level flow

1. Host runs Claude CLI.
2. Claude CLI points to local wrapper proxy at `127.0.0.1:18082`.
3. Wrapper container runs upstream `fcc-server`.
4. Upstream routes requests to configured provider model.

## Components

- `Dockerfile`: builds image from pinned upstream ref.
- `start.sh`: builds image and launches container.
- `verify.sh`: checks authenticated health endpoint.
- `.env.container`: runtime provider and auth settings.

## Security boundaries

- Admin UI is local-only inside container.
- Proxy auth token protects external API routes.
- Secrets are runtime-only via `.env.container`.

## Design tradeoffs

- Building from upstream each run favors reproducibility over fastest local rebuild.
- Wrapper-only scope reduces merge friction with upstream updates.
