# Agentova API — developer documentation

Source of **docs.agentova.ai**, the developer portal of the Agentova public API v1
and of its official connectors (Zapier, n8n). Built with [Mintlify](https://mintlify.com).

## Rules of this repository

- **The API reference is generated from the contract, never written by hand.**
  `openapi/openapi-v1.yaml` is a verbatim copy of the OpenAPI contract
  (same file as `annexes/` in the connector repositories). It is updated by
  Agentova when the contract changes; do not edit it here.
- **Connector guides live here, not in the connector repositories.** The Zapier
  app has no site of its own, and the n8n README targets developers: anything a
  customer reads about Zapier or n8n belongs to this portal.
- **No secrets, no internal names.** This repository is public: no API key,
  workspace identifier, personal email, internal service name or hostname.
  Examples use obviously fake values in the documented format.
- **English only.** The portal, the contract and the connectors are in English;
  only the Agentova app itself is in French, so its screen names are quoted as
  they appear (for example **Paramètres → API**).
- `dev` is the working branch; `main` is what is deployed. Pull requests target
  `dev`; only `dev` can be merged into `main`.

## Develop locally

```bash
npm ci
npm run dev            # http://localhost:3000, hot reload
npm run validate       # OpenAPI files and build errors (same as CI)
npm run broken-links   # broken links and #anchors, snippets included (same as CI)
npm run lint:openapi   # Redocly lint of the contract
```

`validate` doesn't detect broken links: run both before opening a pull request.
`npm run broken-links` adds `--check-anchors --check-snippets` to `mint broken-links`,
which otherwise skips `#anchors` and the links written in `snippets/`.

Node 20.17 or newer. The Mintlify CLI is the `mint` package (not the legacy
`mintlify` package).

## Structure

| Path | What |
|---|---|
| `docs.json` | Site configuration: theme, colors, logo, navigation |
| `openapi/` | The API contract, source of the generated reference |
| `snippets/` | Blocks shared by several pages (events, pause behavior, lead sources…) |
| `*.mdx` | Guide pages (getting started, webhooks, security, connectors…) |

Links to the generated reference use the page URL Mintlify derives from each
operation's `summary` (for example `/api-reference/list-automations`). Changing a
summary in the contract changes that URL: `npm run broken-links` catches it.

## Deployment

Mintlify deploys `main` automatically (GitHub app connected to this repository,
Agentova-owned Mintlify organization). Preview locally with `npm run dev` before
opening a pull request.
