# Memotopia

**O seu Repositório Modular de Escrita e Pensamento.**

A Memotopia é um projeto modelo que implementa a filosofia "Docs-as-Code" (ou "Content-as-Code") para gerenciar, versionar e publicar textos e ideias de forma estruturada e automatizada. Ela foi desenhada para pensar cada texto como um "componente" autônomo, com sua própria lógica, estilo e interconexões.

Este `README.md` detalhado serve como um guia completo para qualquer usuário ou agente de IA que deseje compreender ou interagir com o projeto, incluindo a criação de novos conteúdos e a integração com GitHub Actions.

## 💡 Conceito Central: Docs-as-Code para Projetos de Texto

A ideia principal é tratar o conteúdo escrito (seus textos, ideias, insights e referências) da mesma forma que o código-fonte de um software. Isso significa:

*   **Versionamento:** Todo o conteúdo é gerenciado pelo Git, permitindo histórico completo, colaboração, ramificação (branching) e reversão de mudanças.
*   **Estrutura Definida:** Cada texto segue uma organização predeterminada, facilitando a consistência e a automação.
*   **Automação:** Tarefas repetitivas como validação, indexação e publicação são automatizadas usando GitHub Actions.
*   **Ferramentas CLI:** Scripts personalizados simplificam o fluxo de trabalho local.
*   **Formato Universal:** O uso de Markdown para o conteúdo garante simplicidade, legibilidade e compatibilidade.

## 🏗️ Estrutura do Projeto

A organização do repositório é fundamental para o conceito de modularidade da Memotopia.

```
/memotopia/
├── .github/              # Configurações para GitHub Actions
│   └── workflows/        # Workflows de automação
│       ├── check-style.yml
│       ├── generate-index.yml
│       ├── publish-pages.yml
│       ├── update-nav.yml
│       └── validate-structure.yml
├── INDEX.md              # Índice gerado automaticamente de todos os textos
├── README.md             # Este arquivo
├── memotopia             # Script CLI principal (dispatcher)
├── memotopia-new.sh      # Subcomando para criar novos textos
├── memotopia-push.sh     # Subcomando para git add, commit, pull e push
├── memotopia-update-nav.sh # Subcomando para atualizar links de navegação
└── textos/               # Diretório contendo todos os projetos de texto
    ├── <NOME_DO_TEXTO_1>/   # Exemplo de um componente de texto
    │   ├── assets/              # Mídia (imagens, diagramas, etc.)
    │   │   └── .gitkeep
    │   ├── insights/            # Reflexões e pensamentos relacionados
    │   │   └── 01-primeiro-insight.md
    │   ├── referencias/         # Fontes e citações
    │   │   └── ref1.md
    │   ├── estilo.yml           # Metadados de estilo do texto
    │   └── index.md             # Conteúdo principal do texto
    └── <NOME_DO_TEXTO_2>/   # Outro componente de texto
        └── ...
```

### Detalhes do Diretório `textos/<NOME_DO_TEXTO>/`

Cada diretório sob `textos/` é um "componente de texto" autônomo e obrigatório para a validação das GitHub Actions. As regras são:

*   **`index.md`**: O arquivo principal do texto. **DEVE** começar com um frontmatter YAML (`---`) e o título do texto como o primeiro cabeçalho Markdown (`# Meu Título`).
*   **`estilo.yml`**: Contém metadados descritivos sobre o estilo do texto (ex: `voz`, `ritmo`, `metaforas`). **DEVE** conter os campos especificados para passar na validação `check-style.yml`.
*   **`insights/`**: Um diretório para insights, comentários ou anotações específicas relacionadas ao `index.md` principal. Cada insight é um arquivo `.md` separado.
*   **`referencias/`**: Um diretório para fontes, citações ou links externos que fundamentam o `index.md` principal. Cada referência é um arquivo `.md` separado.
*   **`assets/`**: Um diretório para armazenar imagens, diagramas ou outros arquivos de mídia que o texto possa utilizar.

## 🌐 GitHub Actions (Pipeline de Automação)

As GitHub Actions automatizam a validação, organização e publicação do seu conteúdo. Elas são acionadas em cada push para a branch `main`.

*   **`validate-structure.yml` (Validar estrutura de texto)**
    *   **Propósito:** Garante que cada componente de texto recém-criado ou modificado adere à estrutura definida do projeto.
    *   **acionamento:** `push` ou `pull_request` para `main` afetando `textos/**`.
    *   **Valida:**
        ```
        - Presença de `index.md`
        - Presença de `insights/`
        - Presença de `referencias/`
        - `index.md` DEVE conter frontmatter YAML (`---` na primeira linha).
        ```
    *   **Comportamento em Falha:** Este workflow **FALHA** se alguma das condições acima não for atendida. Isso é uma escolha de design para impor padrões rigorosos de conteúdo "as-code". Um componente que não segue a estrutura pode causar problemas em etapas futuras (ex: publicação).

*   **`check-style.yml` (Validar metadados de estilo)**
    *   **Propósito:** Confere se os arquivos `estilo.yml` dentro de cada componente de texto contêm os campos obrigatórios esperados.
    *   **acionamento:** `pull_request` para `main` afetando `textos/**/estilo.yml`.
    *   **Valida:**
        ```
        - Presença do campo `voz:`
        - Presença do campo `ritmo:`
        - Presença do campo `metaforas:`
        ```
    *   **Comportamento em Falha:** Este workflow **FALHA** se os campos necessários não forem encontrados.

*   **`generate-index.yml` (Atualizar índice de textos)**
    *   **Propósito:** Cria e mantém o arquivo `INDEX.md` na raiz do repositório, listando todos os projetos de texto disponíveis com links para seus respectivos `index.md`.
    *   **acionamento:** `push` para `main` afetando `textos/**`.
    *   **Funcionamento:** Itera sobre `textos/*/`, extrai o **nome do diretório** como título e adiciona uma entrada formatada ao `INDEX.md`.
    *   **Importante:** Esta Action **cria um novo commit** e o envia para a `main`, o que pode fazer com que sua branch local fique atrás da remota. Veja a seção de Git Workflow para lidar com isso.

*   **`update-nav.yml` (Update Navigation Links)**
    *   **Propósito:** Automatiza a manutenção de links de navegação entre os componentes do texto e para o índice principal da Memotopia.
    *   **acionamento:** `push` para `main`.
    *   **Funcionamento:**
        *   Para cada `textos/<NOME_DO_TEXTO>/index.md`:
            *   Adiciona um link `[Voltar ao Índice da Memotopia](../../INDEX.md)` no topo (logo após o frontmatter).
            *   Gera uma seção `## Conteúdo Relacionado` com links para `insights/*.md` e `referencias/*.md` daquele texto específico.
        *   Para cada `insights/*.md` e `referencias/*.md`:
            *   Garante que o link `[Voltar ao Texto Principal](../index.md)` esteja presente no final do arquivo.
    *   **Importante:** Esta Action **cria um novo commit** e o envia para a `main` se encontrar e aplicar alterações.

*   **`publish-pages.yml` (Publicar site da Memotopia)**
    *   **Propósito:** Implanta o conteúdo do repositório como um site estático no GitHub Pages. Através deste site, os textos se tornam acessíveis publicamente.
    *   **acionamento:** `push` para `main`.
    *   **Funcionamento:**
        *   Cria um diretório `public/`.
        *   Gera um `public/index.html` básico que lista os textos (usando o **nome do diretório** como título) e linka para os arquivos `index.md` no **repositório GitHub (não a versão renderizada no GH Pages)**.
        *   Copia a pasta `textos/` para `public/textos/`.
        *   Faz o upload do diretório `public/` como um artefato para o GitHub Pages.
    *   **Limitação Atual:** Atualmente, os arquivos `.md` são servidos como texto bruto no GitHub Pages. Para uma renderização completa em HTML, seria necessário um Static Site Generator (veja Melhorias Futuras).

## 🚀 Memotopia CLI (Ferramentas de Workflow Local)

O script principal `memotopia` atua como um gerenciador de linha de comando para simplificar as operações do projeto.

**Para usá-lo globalmente no seu terminal (sem `./`):**
Você precisa criar um `alias` no seu arquivo de configuração do shell (ex: `~/.bashrc` ou `~/.zshrc`).
```bash
alias memotopia='/workspaces/memotopia/memotopia'
```
Após adicionar, execute `source ~/.bashrc` (ou `source ~/.zshrc`) ou abra um novo terminal.

### `memotopia new <nome-do-texto>`

**Propósito:** Cria a estrutura de diretórios e arquivos necessária para um novo componente de texto.

*   **Uso:**
    ```bash
    memotopia new meu-novo-texto
    ```
*   **O que faz:**
    *   Cria `textos/meu-novo-texto/`, `assets/`, `insights/`, `referencias/`.
    *   Cria `textos/meu-novo-texto/index.md` com frontmatter YAML (`---`) e título derivado do nome.
    *   Cria `textos/meu-novo-texto/estilo.yml` com metadados padrão.
    *   Cria `insights/01-primeiro-insight.md` e `referencias/ref1.md` com links automáticos de "Voltar ao Texto Principal" e frontmatter.

### `memotopia push "mensagem de commit"`

**Propósito:** Automatiza o fluxo de trabalho Git (adicionar, commitar, puxar e enviar) para sincronizar suas alterações com o repositório remoto.

*   **Uso:**
    ```bash
    memotopia push "feat: adiciona novo texto sobre IA"
    ```
    Ou, para que o script solicite a mensagem de commit:
    ```bash
    memotopia push
    ```
*   **O que faz:**
    *   `git add .`: Adiciona todas as modificações e novos arquivos ao "stage".
    *   `git commit -m "mensagem"`: Cria um commit com a mensagem fornecida.
    *   `git pull --rebase`: Sincroniza sua branch local com a remota, reaplicando seus commits sobre as últimas alterações do servidor. **Isso é crucial para manter um histórico limpo e resolver conflitos antes do envio.**
    *   `git push`: Envia suas alterações (já integradas) para o repositório remoto.

### `memotopia update-nav`

**Propósito:** Atualiza e mantém a consistência dos links de navegação em todos os textos.

*   **Uso:**
    ```bash
    memotopia update-nav
    ```
*   **O que faz:**
    *   **Para cada `textos/<NOME_DO_TEXTO>/index.md`:**
        *   Adiciona (ou garante a presença) do link `[Voltar ao Índice da Memotopia](../../INDEX.md)` no topo (após o frontmatter).
        *   Gera ou atualiza uma seção "Conteúdo Relacionado" com links para todos os `insights/*.md` e `referencias/*.md` daquele texto específico.
    *   **Para cada `insights/*.md` e `referencias/*.md` existentes:**
        *   Garante que o link `[Voltar ao Texto Principal](../index.md)` esteja presente no final do arquivo.

## 🤝 Diretrizes de Contribuição e Uso

Para garantir a organização e a automação do projeto:

1.  **Crie Novos Textos com `memotopia new`**: Sempre utilize o comando `./memotopia new <NOME_DO_TEXTO>` (ou `memotopia new <NOME_DO_TEXTO>` após configurar o alias) para iniciar novos componentes de texto. Isso garante a estrutura e o frontmatter corretos.
2.  **Edite Conteúdo**: Modifique os arquivos `.md` e `.yml` conforme necessário dentro do diretório do seu texto.
3.  **Sincronize Suas Alterações com `memotopia push`**: Use `./memotopia push "Sua Mensagem"` para salvar seu trabalho, integrar as alterações de outros e enviar para o repositório remoto.
4.  **Atenção aos Commits das Actions**: Lembre-se que as Actions `generate-index.yml` e `update-nav.yml` podem criar commits na `main`. Se você precisar fazer novas alterações logo após uma Action completar, faça um `git pull` (ou `memotopia push` sem mensagem de commit) antes de começar para garantir que sua branch local esteja atualizada.
5.  **Verifique as GitHub Actions**: Monitore a aba "Actions" do seu repositório no GitHub para garantir que todas as validações e publicações estão ocorrendo sem erros.

## ✨ Melhorias Futuras (Consideradas)

*   **Integração com Static Site Generator (SSG)**: Para renderização completa e estilizada dos arquivos Markdown em HTML no GitHub Pages (ex: Jekyll, Hugo, Next.js).
*   **Funcionalidade de Busca:** Implementar uma barra de busca no site do GitHub Pages para facilitar a descoberta de conteúdo.
*   **Metadados Mais Ricos:** Expandir os metadados nos arquivos `estilo.yml` (ou em um novo arquivo `/meta.yml`) permitindo categorização, tags, autores, datas, etc.
*   **Extração de Títulos Dinâmica:** Modificar `generate-index.yml` e `publish-pages.yml` para extrair o título real do primeiro cabeçalho (`# Meu Título`) do `index.md`, em vez de usar o nome do diretório.
*   **Linting de Conteúdo:** Adicionar verificação de links quebrados, ortografia ou outras regras de qualidade para o conteúdo Markdown.