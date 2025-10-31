#!/bin/bash

# Adiciona todos os arquivos modificados e novos
git add .

# Verifica se há algo para commitar
if git diff --cached --quiet; then
  echo "Nenhuma alteração para commitar."
  exit 0
fi

# Obtém a mensagem de commit
if [ -z "$1" ]; then
  read -p "Digite a mensagem de commit: " commit_message
else
  commit_message="$1"
fi

# Verifica se a mensagem de commit não está vazia
if [ -z "$commit_message" ]; then
  echo "Mensagem de commit não pode ser vazia. Abortando."
  exit 1
fi

# Faz o commit
git commit -m "$commit_message"

# Puxa as últimas alterações do remoto com rebase para evitar conflitos
echo "Puxando as últimas alterações do repositório remoto..."
git pull --rebase

# Verifica se o pull foi bem-sucedido (sem conflitos não resolvidos)
if [ $? -ne 0 ]; then
  echo "❌ Conflitos detectados durante o git pull --rebase. Por favor, resolva-os manualmente e tente novamente."
  exit 1
fi

# Envia as alterações para o repositório remoto
echo "Enviando alterações para o repositório remoto..."
git push

if [ $? -eq 0 ]; then
  echo "✅ Alterações enviadas com sucesso!"
else
  echo "❌ Falha ao enviar alterações. Verifique o status do Git."
  exit 1
fi
