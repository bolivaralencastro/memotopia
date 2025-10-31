#!/bin/bash

set -euo pipefail

TEXT_DIR="${1-}"
TITLE="${2-}"
AUTHOR=""
LINK=""

shift_count=0
if [ -n "${TEXT_DIR}" ]; then shift_count=$((shift_count+1)); fi
if [ -n "${TITLE}" ]; then shift_count=$((shift_count+1)); fi

shift ${shift_count:-0} || true

while (( "$#" > 0 )); do
  case "${1}" in
    --autor)
      AUTHOR="${2-}"
      shift 2 || true
      ;;
    --link)
      LINK="${2-}"
      shift 2 || true
      ;;
    *)
      shift 1 || true
      ;;
  esac
done

if [ -z "${TEXT_DIR}" ] || [ -z "${TITLE}" ]; then
  echo "❌ Use: memotopia ref <nome-do-texto> \"Título da referência\" [--autor Nome] [--link URL]"
  exit 1
fi

BASE_DIR="textos/${TEXT_DIR}/referencias"
if [ ! -d "${BASE_DIR}" ]; then
  echo "❌ Diretório não encontrado: ${BASE_DIR}"
  echo "   Certifique-se de que o texto '${TEXT_DIR}' existe."
  exit 1
fi

# encontra próximo índice de refN.md
shopt -s nullglob
existing=("${BASE_DIR}"/ref*.md)
max_num=0
for f in "${existing[@]}"; do
  bn=$(basename "$f")
  if [[ "$bn" =~ ^ref([0-9]{1,})\.md$ ]]; then
    n=${BASH_REMATCH[1]}
    if (( 10#$n > max_num )); then
      max_num=$((10#$n))
    fi
  fi
done
next_num=$((max_num + 1))

filename="${BASE_DIR}/ref${next_num}.md"

if [ -f "${filename}" ]; then
  echo "❌ Arquivo já existe: ${filename}"
  exit 1
fi

cat > "${filename}" <<EOT
---
# ${TITLE}
---

Notas:

[Voltar ao Texto Principal](../index.md)
EOT

# Acrescenta metadados opcionais se fornecidos
if [ -n "${AUTHOR}" ]; then
  sed -i "3a Autor: ${AUTHOR}" "${filename}"
fi
if [ -n "${LINK}" ]; then
  sed -i "3a Link: ${LINK}" "${filename}"
fi

echo "📚 Referência criada: ${filename}"

