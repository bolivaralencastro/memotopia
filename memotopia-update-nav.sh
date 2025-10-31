#!/bin/bash

set -euo pipefail

echo "Iniciando atualização de navegação para todos os textos..."

# Função para adicionar link ao INDEX.md principal
add_link_to_main_index() {
  local file="$1"
  local link="[Voltar ao Índice da Memotopia](../../INDEX.md)"
  local temp_file=$(mktemp)

  if ! grep -qF "$link" "$file"; then
    echo "Adicionando link para INDEX.md em $file"
    # Read frontmatter
    local frontmatter=""
    local content_start_line=1
    if head -n 1 "$file" | grep -q '^---$'; then
      frontmatter=$(sed -n '/^---$/,/^---$/p' "$file")
      content_start_line=$(grep -n '^---$' "$file" | tail -n 1 | cut -d: -f1)
      content_start_line=$((content_start_line + 1))
    fi

    # Prepend link after frontmatter
    {
      echo "$frontmatter"
      echo ""
      echo "$link"
      echo ""
      tail -n +"$content_start_line" "$file"
    } > "$temp_file"
    mv "$temp_file" "$file"
  fi
}

# Função para gerar seção de conteúdo relacionado
generate_related_content_section() {
  local index_file="$1"
  local text_dir=$(dirname "$index_file")
  local related_content=""

  related_content+="\n## Conteúdo Relacionado\n\n"
  related_content+="<!-- RELATED_CONTENT_START -->\n"

  # Insights
  if compgen -G "${text_dir}/insights/*.md" > /dev/null; then
    related_content+="### Insights\n"
    for insight_file in "${text_dir}/insights/"*.md; do
      local insight_name=$(basename "$insight_file" .md)
      local display_name=$(head -n 2 "$insight_file" | grep '^#' | sed 's/^# //g' | sed 's/.*/\u&/' || echo "$insight_name")
      related_content+="*   [${display_name}](./insights/${insight_name}.md)\n"
    done
  fi

  # Referências
  if compgen -G "${text_dir}/referencias/*.md" > /dev/null; then
    related_content+="### Referências\n"
    for ref_file in "${text_dir}/referencias/"*.md; do
      local ref_name=$(basename "$ref_file" .md)
      local display_name=$(head -n 2 "$ref_file" | grep '^#' | sed 's/^# //g' | sed 's/.*/\u&/' || echo "$ref_name")
      related_content+="*   [${display_name}](./referencias/${ref_name}.md)\n"
    done
  fi
  related_content+="<!-- RELATED_CONTENT_END -->\n"

  local temp_file=$(mktemp)
  local current_content=$(cat "$index_file")

  if [[ "$current_content" =~ "<!-- RELATED_CONTENT_START -->" && "$current_content" =~ "<!-- RELATED_CONTENT_END -->" ]]; then
    # Replace existing section
    echo "$current_content" | sed "/<!-- RELATED_CONTENT_START -->/,/<!-- RELATED_CONTENT_END -->/c\$related_content" > "$temp_file"
  else
    # Append new section
    echo "$current_content" >> "$temp_file"
    echo "$related_content" >> "$temp_file"
  fi
  mv "$temp_file" "$index_file"
}

# Função para adicionar link de retorno a arquivos menores
add_return_link_to_sub_files() {
  local file="$1"
  local link="[Voltar ao Texto Principal](../index.md)"
  local temp_file=$(mktemp)

  if ! grep -qF "$link" "$file"; then
    echo "Adicionando link de retorno em $file"
    echo "" >> "$file" # Ensure a newline before appending
    echo "$link" >> "$file"
  fi
}


# Processar cada diretório de texto
shopt -s nullglob
for text_dir in textos/*/ ; do
  echo "Processando diretório: $text_dir"
  local index_md="${text_dir}index.md"

  if [ -f "$index_md" ]; then
    add_link_to_main_index "$index_md"
    generate_related_content_section "$index_md"
  fi

  # Processar insights
  for insight_file in "${text_dir}/insights/"*.md; do
    add_return_link_to_sub_files "$insight_file"
  done

  # Processar referencias
  for ref_file in "${text_dir}/referencias/"*.md; do
    add_return_link_to_sub_files "$ref_file"
  done
done

echo "Atualização de navegação concluída."
