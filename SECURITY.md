# Security Policy

## Supported versions

Only the latest release is supported with security updates.

## Reporting a vulnerability

Please do not open a public issue for sensitive vulnerabilities.

Contact the maintainer privately with:

- affected version/tag
- reproduction steps
- impact assessment
- suggested mitigation (if known)

## Secrets handling

- Never commit real API keys or tokens.
- Use `.env.container.example` as the template.
- `.env.container` is intentionally gitignored.
