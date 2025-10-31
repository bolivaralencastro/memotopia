# Guia de Uso de IAs na Memotopia

Objetivo: padronizar como Qwen, Gemini, Cursor IDE e outras IAs interagem com este repositório para maximizar precisão e reduzir ambiguidade.

## Princípios
- Fonte única da verdade: cada texto é um componente em `textos/<nome>/`.
- Metadados próximos do conteúdo: `estilo.yml` no diretório do texto e frontmatter no `index.md`.
- Prompts versionados: use templates em `prompts/`.
- Validação automatizada: CI bloqueia estrutura incorreta.

## Convenções por arquivo
- `textos/<nome>/index.md`:
  - Deve iniciar com `---` (frontmatter). O primeiro `#` é o título canônico.
  - Incluir contexto mínimo: objetivo, público-alvo, mensagem-chave.
- `textos/<nome>/estilo.yml`:
  - Campos obrigatórios: `voz`, `ritmo`, `metaforas`.
  - Opcional recomendado: `publico`, `objetivo`, `tom`, `restricoes`.
- `textos/<nome>/insights/NN-slug.md`:
  - Numeração incremental (`01-...`, `02-...`).
- `textos/<nome>/referencias/refN.md`:
  - Sequencial (`ref1.md`, `ref2.md`).

## Fluxo recomendado com IA
1. Selecionar template em `prompts/` (texto, insight, referência).
2. Preencher slots (título, objetivo, público, fontes, constraints).
3. Rodar no Cursor IDE (ou CLI da IA) apontando para o diretório do texto.
4. Gerar arquivos pelo CLI (`memotopia-insight`/`memotopia-ref`) e colar o conteúdo gerado.
5. Executar `memotopia update-nav` para atualizar navegação.
6. Commit com mensagem clara (ex.: `feat(textos/<nome>): novo insight 03-...`).

## Boas práticas de prompt
- Contextualize sempre com: objetivo, público, tom/voz (de `estilo.yml`) e exemplos.
- Dê formato-alvo explícito (Markdown), com seções/cabeçalhos desejados.
- Limite escopo: um pedido por vez (texto principal, insight OU referência).
- Peça validação: “verifique se há títulos duplicados/links quebrados”.

## Anti-padrões (evitar)
- Gerar arquivos sem seguir os nomes padronizados.
- Misturar metadados contraditórios entre frontmatter e `estilo.yml`.
- Alterar `INDEX.md` manualmente (é gerado pela CI).

## Ferramentas locais
- Criar insight (Bash): `./memotopia-insight.sh <texto> "Título"`
- Criar insight (PowerShell): `pwsh -File .\\memotopia-insight.ps1 <texto> "Título"`
- Criar referência (Bash): `./memotopia-ref.sh <texto> "Título" [--autor][--link]`
- Criar referência (PowerShell): `pwsh -File .\\memotopia-ref.ps1 <texto> "Título" -Autor "Nome" -Link "URL"`
- Atualizar navegação: `./memotopia update-nav`

## CLIs recomendadas

### Gemini (Google)
- Pré-requisito: Node.js >= 20
- Instalar globalmente:
```bash
npm install -g @google/gemini-cli
```
- Rodar:
```bash
gemini
# ou sem global
npx @google/gemini-cli
```

### Qwen (local com Ollama)
- Windows (PowerShell):
```powershell
winget install Ollama.Ollama
ollama pull qwen2:7b
ollama run qwen2:7b
```
- macOS (Homebrew):
```bash
brew install ollama
ollama pull qwen2:7b
ollama run qwen2:7b
```

## Dicas específicas (Cursor IDE)
- Abra o diretório do texto no contexto do chat antes de pedir geração.
- Use mensagens curtas e precisas; cole trechos de `estilo.yml` e do `index.md`.
- Utilize diffs pequenos; aplique e rode a navegação.

## Extensões futuras
- Lint de Markdown/links.
- Geração HTML com SSG.
