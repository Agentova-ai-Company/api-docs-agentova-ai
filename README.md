# Agentova API — developer documentation

Source of **docs.agentova.ai**, the developer portal of the Agentova public API v1
and of its official connectors (Zapier, n8n). Built with [Mintlify](https://mintlify.com).

## Rules of this repository

- **The API reference is generated from the contract, never written by hand.**
  `openapi/openapi-v1-draft.yaml` is a verbatim copy of the OpenAPI contract
  (same file as `annexes/` in the connector repositories). It is updated by
  Agentova when the contract changes; do not edit it here.
- **Connector guides live here, not in the connector repositories.** The Zapier
  app has no site of its own, and the n8n README targets developers: anything a
  customer reads about Zapier or n8n belongs to this portal.
- **No secrets, no internal names.** This repository is public: no API key,
  workspace identifier, personal email, internal service name or hostname.
- `dev` is the working branch; `main` is what is deployed. Pull requests target
  `dev`; only `dev` can be merged into `main`.

## Develop locally

```bash
npm ci
npm run dev            # http://localhost:3000, hot reload
npm run validate       # broken links, OpenAPI, build errors (same as CI)
npm run lint:openapi   # Redocly lint of the contract
```

Node 20.17 or newer. The Mintlify CLI is the `mint` package (not the legacy
`mintlify` package).

## Structure

| Path | What |
|---|---|
| `docs.json` | Site configuration: theme, colors, navigation |
| `openapi/` | The API contract, source of the generated reference |
| `*.mdx` | Guide pages (getting started, authentication, webhooks, connectors…) |

## Deployment

Mintlify deploys `main` automatically once the GitHub app is connected to this
repository (Agentova-owned Mintlify organization). Preview locally with
`npm run dev` before opening a pull request.
