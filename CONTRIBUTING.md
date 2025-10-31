# Contribuindo para a Memotopia

Obrigado por contribuir! Este guia resume como propor mudanças de forma consistente e segura.

## Fluxo de trabalho
1. Crie uma branch a partir da `main`.
2. Faça suas mudanças localmente.
3. Rode os checks locais (opcional) e organize a navegação: `./memotopia update-nav`.
4. Commit e push: `./memotopia push "mensagem"` (ou use Git normal).
5. Abra um Pull Request descrevendo claramente o que foi alterado.

## Como adicionar um novo texto
- Via CLI Bash:
  - `./memotopia new meu-novo-texto`
- Via PowerShell (Windows):
  - `pwsh -File .\\memotopia-insight.ps1 <texto> "Título"`
  - `pwsh -File .\\memotopia-ref.ps1 <texto> "Título" -Autor "Nome" -Link "URL"`
- Estrutura mínima em `textos/<nome>/`:
  - `index.md` (com frontmatter `---` na primeira linha e título `#`)
  - `estilo.yml` (campos obrigatórios: `voz`, `ritmo`, `metaforas`)
  - `insights/`, `referencias/`, `assets/`

## Padrões de commits
- Use prefixos quando possível: `feat:`, `fix:`, `docs:`, `chore:`, `ci:`.
- Mensagens curtas e descritivas.

## Qualidade e automações (CI)
- PRs e pushes disparam GitHub Actions que:
  - Validam estrutura dos textos (`validate-structure`)
  - Verificam `estilo.yml` (`check-style`)
  - Geram/atualizam `INDEX.md` (`generate-index`)
  - Atualizam navegação e conteúdo relacionado (`update-nav`)
  - Publicam site estático simples no GitHub Pages (`publish-pages`)

## Convenções de conteúdo
- Títulos: primeira linha do `index.md` deve ser `---` (frontmatter) e o primeiro cabeçalho `#` deve ser o título do texto.
- Insights: arquivos `insights/NN-slug.md` (numeração incremental, slug em minúsculas com hífens).
- Referências: `referencias/refN.md` (sequencial).

## Código de Conduta
- Seja respeitoso, claro e objetivo nas revisões. Feedbacks construtivos são bem-vindos.

## Dúvidas
Abra uma Issue com o rótulo `question`.
