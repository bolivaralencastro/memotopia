#!/bin/bash
TITULO=$1
if [ -z "$TITULO" ]; then
  echo "❌ Use: memotopia nome-do-texto"
  exit 1
fi

mkdir -p textos/$TITULO/{insights,referencias,assets}

cat > textos/$TITULO/index.md <<EOT
---
# $(echo $TITULO | sed 's/-/ /g' | sed 's/.*/\u&/')

Texto inicial da Memotopia chamado **$TITULO**.
Aqui você pode começar a escrever a ideia central, narrativa ou reflexão.
EOT

cat > textos/$TITULO/estilo.yml <<EOT
voz: reflexiva
ritmo: fluido
metaforas: "jardim, oficina, mente viva"
EOT

cat > textos/$TITULO/insights/01-primeiro-insight.md <<EOT
---
# Insight Inicial
---

- Insight inicial: todo texto nasce como uma semente.

[Voltar ao Texto Principal](../index.md)
EOT

cat > textos/$TITULO/referencias/ref1.md <<EOT
---
# Referência Simbólica
---

Autor: Exemplo
Link: https://example.com
Notas: referência inicial para $TITULO

[Voltar ao Texto Principal](../index.md)
EOT

touch textos/$TITULO/assets/.gitkeep
echo "🌱 Texto '$TITULO' criado com sucesso!"
