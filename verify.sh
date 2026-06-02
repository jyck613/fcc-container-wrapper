#!/usr/bin/env bash
set -euo pipefail

BASE_URL="${BASE_URL:-http://127.0.0.1:18082}"
AUTH_TOKEN="${AUTH_TOKEN:-freecc}"
MAX_ATTEMPTS="${MAX_ATTEMPTS:-20}"
SLEEP_SECONDS="${SLEEP_SECONDS:-1}"

for ((i=1; i<=MAX_ATTEMPTS; i++)); do
  code=$(curl -sS -o /tmp/fcc_health.json -w '%{http_code}' \
    -H "Authorization: Bearer ${AUTH_TOKEN}" \
    "${BASE_URL}/" || true)

  if [[ "$code" == "200" ]]; then
    echo "health_check=ok"
    cat /tmp/fcc_health.json
    exit 0
  fi

  echo "attempt_${i}=status_${code}"
  sleep "$SLEEP_SECONDS"
done

echo "health_check=failed"
echo "Could not get 200 from ${BASE_URL}/ within ${MAX_ATTEMPTS} attempts"
exit 1
