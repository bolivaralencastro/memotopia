#!/bin/bash

set -euo pipefail

TEXT_DIR="${1-}"
TITLE="${2-}"

if [ -z "${TEXT_DIR}" ] || [ -z "${TITLE}" ]; then
  echo "❌ Use: memotopia insight <nome-do-texto> \"Título do insight\""
  exit 1
fi

BASE_DIR="textos/${TEXT_DIR}/insights"
if [ ! -d "${BASE_DIR}" ]; then
  echo "❌ Diretório não encontrado: ${BASE_DIR}"
  echo "   Certifique-se de que o texto '${TEXT_DIR}' existe."
  exit 1
fi

# slugify simples: minúsculas, espaços->hífen, remove não alfanumérico/hífen
slug=$(echo "${TITLE}" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g' | sed 's/[^a-z0-9-]//g' | sed 's/--\+/-/g' | sed 's/^-\|-$//g')

# encontra próximo número (do padrão NN-*.md)
next_num=1
shopt -s nullglob
existing=("${BASE_DIR}"/*.md)
max_num=0
for f in "${existing[@]}"; do
  bn=$(basename "$f")
  if [[ "$bn" =~ ^([0-9]{1,})- ]]; then
    n=${BASH_REMATCH[1]}
    if (( 10#$n > max_num )); then
      max_num=$((10#$n))
    fi
  fi
done
next_num=$((max_num + 1))

filename=$(printf "%s/%02d-%s.md" "${BASE_DIR}" "${next_num}" "${slug}")

if [ -f "${filename}" ]; then
  echo "❌ Arquivo já existe: ${filename}"
  exit 1
fi

cat > "${filename}" <<EOT
---
# ${TITLE}
---

- Escreva aqui o insight.

[Voltar ao Texto Principal](../index.md)
EOT

echo "📝 Insight criado: ${filename}"

