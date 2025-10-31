#!/usr/bin/env bash
set -euo pipefail

echo "🧹 Desinstalando Memotopia…"

# Remove binário global, se existir
if command -v memotopia >/dev/null 2>&1; then
  if [[ -w "/usr/local/bin/memotopia" ]]; then
    sudo rm -f /usr/local/bin/memotopia || true
  fi
fi

# Detecta RC do shell
if [[ -n "${ZSH_VERSION-}" ]]; then
  SHELL_RC="$HOME/.zshrc"
elif [[ -n "${BASH_VERSION-}" ]]; then
  SHELL_RC="$HOME/.bashrc"
else
  SHELL_RC="$HOME/.profile"
fi

# Remove linha do alias, se existir
if [[ -f "$SHELL_RC" ]]; then
  if grep -Fq "alias memotopia=" "$SHELL_RC"; then
    # Cria backup e filtra a linha do alias
    cp "$SHELL_RC" "$SHELL_RC.bak-memotopia"
    grep -Fv "alias memotopia=" "$SHELL_RC.bak-memotopia" > "$SHELL_RC"
    echo "✅ Alias removido de $SHELL_RC (backup em $SHELL_RC.bak-memotopia)"
  else
    echo "ℹ️  Alias 'memotopia' não encontrado em $SHELL_RC"
  fi
fi

echo "✨ Memotopia desinstalada (alias/binário removidos)."
echo "   Reinicie o terminal para garantir limpeza total."
