FROM python:3.14-slim

ARG UPSTREAM_REPO=https://github.com/Alishahryar1/free-claude-code.git
ARG UPSTREAM_REF=9a2c5fbeb90c79cd0139a4044e05fee7d1ba056a

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl ca-certificates git \
    && rm -rf /var/lib/apt/lists/*

# Install uv for dependency sync
RUN pip install --no-cache-dir uv

# Pull upstream source at a pinned ref for reproducible builds.
RUN git clone "${UPSTREAM_REPO}" /src/free-claude-code \
    && cd /src/free-claude-code \
    && git checkout "${UPSTREAM_REF}"

WORKDIR /app
RUN cp -a /src/free-claude-code/. /app/
RUN uv sync --frozen

EXPOSE 8082

CMD ["uv", "run", "fcc-server"]
