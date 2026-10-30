#!/usr/bin/env bash
# Le logo et le favicon de la doc sont COPIÉS du paquet
# `@agentova-ai-company/brand`, jamais retouchés. Ce dépôt est public : il n'a
# pas accès au registre privé du paquet. Il compare donc ses copies à celles
# que sert l'application, elles-mêmes vérifiées contre le paquet par
# `pnpm check:brand` dans saas-agentova-ai.
set -euo pipefail

BASE_URL="${BRAND_BASE_URL:-https://app.agentova.ai/brand}"
status=0
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

while IFS= read -r file; do
  relative="${file#brand/}"
  mkdir -p "$tmp/$(dirname "$relative")"
  curl --fail --silent --show-error --retry 3 "$BASE_URL/$relative" --output "$tmp/$relative"
  if cmp --silent "$tmp/$relative" "$file"; then
    echo "OK  $file"
  else
    echo "KO  $file diffère du paquet de marque : recopier $relative"
    status=1
  fi
done < <(find brand -type f | sort)
exit "$status"
