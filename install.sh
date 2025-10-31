#!/usr/bin/env bash
set -euo pipefail

echo "🧠 Instalando Memotopia…"

# Caminho absoluto do script novo_texto.sh dentro deste repo
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPT_PATH="$REPO_DIR/novo_texto.sh"

if [[ ! -f "$SCRIPT_PATH" ]]; then
  echo "❌ Arquivo novo_texto.sh não encontrado em: $SCRIPT_PATH"
  echo "   Crie-o antes de instalar."
  exit 1
fi

chmod +x "$SCRIPT_PATH"

# Flags
GLOBAL=0
for arg in "${@:-}"; do
  [[ "$arg" == "--global" ]] && GLOBAL=1
done

if [[ "$GLOBAL" -eq 1 ]]; then
  # Instalação global (coloca 'memotopia' no PATH, sem alias)
  TARGET="/usr/local/bin/memotopia"
  echo "🔧 Instalando globalmente em $TARGET (pode pedir sudo)…"
  sudo install -m 0755 "$SCRIPT_PATH" "$TARGET"
  echo "✅ Comando global instalado: memotopia"
  echo "   Use: memotopia \"nome-do-texto\""
  exit 0
fi

# Instalação via alias (persistente no shell do usuário)
# Detecta arquivo RC do shell
if [[ -n "${ZSH_VERSION-}" ]]; then
  SHELL_RC="$HOME/.zshrc"
elif [[ -n "${BASH_VERSION-}" ]]; then
  SHELL_RC="$HOME/.bashrc"
else
  SHELL_RC="$HOME/.profile"
fi

# Linha de alias que aponta para o caminho ABSOLUTO do script
ALIAS_LINE="alias memotopia='bash $SCRIPT_PATH'"

# Não duplica o alias
if grep -Fq "alias memotopia=" "$SHELL_RC" 2>/dev/null; then
  echo "ℹ️  Alias 'memotopia' já existe em $SHELL_RC — não será duplicado."
else
  echo "$ALIAS_LINE" >> "$SHELL_RC"
  echo "✅ Alias 'memotopia' adicionado a $SHELL_RC"
fi

# Recarrega RC (se possível)
# Em alguns shells/ambientes, o source pode não ter efeito no terminal atual.
# Mesmo assim, o alias estará disponível nas próximas sessões.
if [[ -r "$SHELL_RC" ]]; then
  # Não falha se o shell atual não for bash/zsh interativo
  source "$SHELL_RC" || true
fi

echo "🌱 Instalação concluída!"
echo "👉 Agora use:  memotopia \"nome-do-texto\""
echo "   (se o comando não aparecer imediatamente, abra um novo terminal)"
