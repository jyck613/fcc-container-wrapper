# syntax=docker/dockerfile:1

# Pinned upstream source for reproducible builds.
ARG UPSTREAM_REPO=https://github.com/Alishahryar1/free-claude-code.git
ARG UPSTREAM_REF=ee15ce4122080b9eed3e119b8a78326bfb39e498

# ----------------------------------------------------------------------------
# Builder stage: clone upstream and resolve dependencies. None of the build
# tooling (git, uv, pip caches) is carried into the final image.
# ----------------------------------------------------------------------------
FROM python:3.14-slim AS builder

ARG UPSTREAM_REPO
ARG UPSTREAM_REF

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    UV_LINK_MODE=copy \
    UV_PYTHON_DOWNLOADS=never \
    UV_COMPILE_BYTECODE=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    git ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir uv

WORKDIR /app

# Pull upstream source at a pinned ref, then drop the .git history.
RUN git clone "${UPSTREAM_REPO}" /app \
    && git -C /app checkout "${UPSTREAM_REF}" \
    && rm -rf /app/.git

# Install only runtime dependencies (no dev group) into /app/.venv,
# reusing the base image's system Python instead of a managed download.
RUN uv sync --frozen --no-dev --no-cache --python /usr/local/bin/python

# ----------------------------------------------------------------------------
# Runtime stage: minimal image with just Python and the prepared app + venv.
# ----------------------------------------------------------------------------
FROM python:3.14-slim AS runtime

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PATH="/app/.venv/bin:$PATH"

# Copy the fully prepared application (source + resolved virtualenv).
COPY --from=builder /app /app

WORKDIR /app

EXPOSE 8082

CMD ["fcc-server"]
