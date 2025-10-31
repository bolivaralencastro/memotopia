# Projeto de Otimização de Interface (Teste A/B)

Este projeto consiste em um teste A/B rigoroso, focado na otimização da interface de digitação de CPF para os totens de cadastro em Hemocentros. O objetivo é mensurar objetiva e subjetivamente qual layout (Versão A, atual, ou Versão B, proposta) resulta em menor tempo de conclusão e menos erros, proporcionando uma experiência de cadastro mais fluida e empática.

---

## 1. Metodologia e Fluxo da Jornada do Usuário

A jornada do participante é estruturada para garantir a neutralidade dos resultados e a consistência da coleta de dados.

### Sorteio e Início

A tela inicial convida o participante a melhorar o totem, reforça a política de privacidade (nenhuma informação pessoal é coletada) e, ao clicar em “Começar Teste”, o aplicativo sorteia automaticamente a ordem de exibição das interfaces (A→B ou B→A), preparando os mecanismos de mensuração.

### Execução dos Testes

O usuário é levado ao primeiro cenário de digitação do CPF, conforme a ordem sorteada. O sistema:

- Captura o tempo gasto e a quantidade de erros (toques de correção/backspace).
- Registra qual interface foi concluída.
- Encaminha o usuário para o formulário de feedback correspondente.

### Coleta de Feedback

Após cada cenário, o participante avalia a interface em questão, fornecendo uma nota de 1 a 5 e um comentário opcional. O formulário de avaliação utiliza um componente único para ambas as interfaces, garantindo a uniformidade na coleta de dados subjetivos. O envio do feedback inicia o teste seguinte ou, se for o segundo cenário, finaliza a pesquisa.

### Encerramento e Engajamento

A tela final agradece a participação e exibe métricas comparativas dos tempos de conclusão do usuário. Em seguida, transforma o resultado em incentivo à doação, apresentando um *call to action* que convida o participante a abrir um painel com hemocentros próximos. Este clique é registrado como um evento de engajamento pós-teste.

---

## 2. Interfaces em Comparação

O experimento confronta o design atual do totem com uma proposta modernizada, focando na usabilidade da entrada de dados numéricos.

| Característica | Versão A (Atual/Legado) | Versão B (Nova/Sugestão) |
| :--- | :--- | :--- |
| **Visual** | Layout original, fundo roxo escuro, display monocromático em caixa alta. | Experiência centralizada em um card claro, título explicativo. |
| **Teclado** | Teclado numérico dividido em seis colunas. Botões extras: “Corrigir” e “Apagar”. | Teclado em grade 3×4 com botões grandes. Ícones para "corrigir" e "confirmar". |
| **Lógica de Entrada** | Aceita somente dígitos (limite de 11). Ações de correção e limpeza são contabilizadas como erro. | Campo de CPF segmentado visualmente com *placeholders*. Confirmação só é habilitada após 11 dígitos. |
| **Erros** | O contador de erros é incrementado ao usar os botões “Corrigir” ou “Apagar”. | O *backspace* é desativado quando não há dígitos, reduzindo erros involuntários, e seu uso é contabilizado como erro. |

---

## 3. Lógica Interna e Instrumentação Analítica

Toda a arquitetura do projeto é projetada para garantir a precisão da mensuração e a robustez da coleta de dados, operando de forma totalmente anônima.

### Máquina de Estados e Mensuração

A jornada é controlada por uma **Máquina de Estados Reativa** (via *signals* e *computed properties*), que garante que a interface se atualize automaticamente ao mudar o estado (Welcome, Teste, Feedback, Finished).

Antes de seguir para a próxima etapa, o sistema registra automaticamente:

- Tempo de conclusão por interface.
- Total de erros cometidos (*backspace*/correções).
- Ordem de exibição (A→B ou B→A).
- Notas e feedback textual.
- Tipo de dispositivo usado.

### Coleta e Logging de Dados

Todos os dados são empacotados em um relatório consolidado e enviados anonimamente a um serviço de *logging* centralizado, utilizando o Google Apps Script como *backend* de coleta.

### Análise Comportamental (Clarity)

Há uma **Instrumentação Analítica** opcional via Microsoft Clarity. O serviço injeta o script apenas em domínios autorizados e marca cada estado/tela com tags customizadas. Isso permite que os pesquisadores realizem análises mais profundas de comportamento (*heatmaps* e gravações de sessão) em ambiente de produção, identificando pontos de hesitação ou falha na digitação.

---

## 4. Benefícios e Tomada de Decisão Orientada por Dados

O teste fornece ao Hemocentro um conjunto robusto de dados quantitativos e qualitativos para a tomada de decisão.

| Tipo de Mensuração | Benefício para a Decisão |
| :--- | :--- |
| **Objetiva (Tempo e Erros)** | Permite identificar qual layout leva a digitações mais rápidas e com menor atrito (gargalos), fundamentando a escolha da interface mais eficiente. |
| **Subjetiva (Notas e Comentários)** | Fornece evidências qualitativas sobre a clareza, conforto e frustrações do usuário. Os *feedbacks* são categorizados por interface (Original ou Nova) e tipo de dispositivo, facilitando a priorização de ajustes. |
| **Comportamental (Clarity)** | Valida visualmente onde os usuários hesitam ou erram, complementando as métricas de tempo e erros e orientando o design em ambientes reais de totem. |
| **Engajamento Pós-Teste** | O registro de cliques no diálogo de hemocentros mede o interesse prático despertado pelo teste, abrindo dados para futuras campanhas de doação. |

Ao combinar estas métricas, o Hemocentro pode selecionar com confiança a interface que garante uma etapa de cadastro de CPF mais rápida e clara, planejando melhorias incrementais antes de implementar a nova versão no totem real.