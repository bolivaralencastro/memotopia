---
# Fechamento do Experimento A/B — Totem Fundação Pró-Sangue

[Voltar ao Índice da Memotopia](../../INDEX.md)

## Design, dados e o aprendizado de projetar o próprio teste

Depois de doar sangue na Fundação Pró-Sangue, em São Paulo, notei algo simples: o totem de autoatendimento poderia oferecer uma digitação de CPF mais intuitiva. Esse pequeno detalhe deu origem a um projeto pessoal de design e pesquisa aplicada, criado com o mesmo propósito da doação — contribuir de forma prática para melhorar a experiência de outras pessoas.

A proposta foi testar duas versões da tela de digitação e medir, de forma estruturada, qual delas era mais rápida, mais clara e menos propensa a erros.

---

## Metodologia e Tecnologia

O experimento foi desenvolvido com Angular + TypeScript e estilizado com TailwindCSS, priorizando leveza, escalabilidade e controle total da experiência do usuário. A coleta de dados foi automatizada com Google Sheets, que registrava tempo de digitação, número de erros e feedbacks em tempo real. O comportamento dos participantes foi acompanhado com o Microsoft Clarity, permitindo observar cliques, rolagens e origens de tráfego — uma visão completa da interação.

O projeto foi hospedado no GitHub Pages e otimizado cuidadosamente, alcançando a pontuação máxima (100/100) em desempenho, acessibilidade, práticas recomendadas e SEO no PageSpeed Insights, tanto em desktop quanto em mobile.

---

## Análise Quantitativa dos Resultados

Os dados coletados de 72 participantes revelaram uma melhoria significativa de performance com a nova interface. A análise quantitativa dos dados mostra uma redução média de 20 a 35% no tempo de digitação na nova versão.

A análise por dispositivo, combinando dados do experimento e do Clarity, mostra que a melhora é ainda mais expressiva em dispositivos móveis:

| Dispositivo | Tempo Médio Original (ms) | Tempo Médio Nova (ms) | Redução Média de Tempo (%) |
|---|---|---|---|
| PC | 120535 | 7534 | 93.75% |
| Mobile | 153394 | 6321 | 95.88% |

---

## Análise Qualitativa e Comportamental

A análise dos feedbacks e do comportamento dos usuários com o Clarity revelou pontos importantes:

*   **Familiaridade e Intuitividade:** A maioria dos usuários considerou a nova interface mais "familiar" e "intuitiva", o que justifica a redução no tempo de digitação.
*   **Uso Mobile:** Quase metade dos acessos (47,8%) foram feitos em dispositivos móveis, um dado que reforça a importância de uma experiência mobile bem resolvida.
*   **Pontos de Fricção:** O Clarity revelou que 11% dos cliques foram "inativos", ocorrendo quando o usuário tentava clicar em botões desabilitados. Além disso, foram registrados 7 erros de JavaScript, indicando pontos de melhoria na estabilidade da aplicação.

---

## Percurso de Divulgação no LinkedIn e Aprendizados

Além das métricas do experimento, a divulgação pública no LinkedIn fez parte do processo de validação social e de engajamento com stakeholders. Em três publicações, o projeto foi apresentado, discutido e iterado, o que trouxe aprendizados sobre alcance, mensagem e momento de solicitar feedback.

Síntese do alcance (22–28 out 2025):

*   **Impressões:** 2.362 | **Usuários alcançados:** 1.588 | **Visitas ao link:** 19
*   **Reações:** 24 | **Comentários:** 12 | **Compartilhamentos:** 0 | **Salvamentos:** 2 | **Envios:** 4

Ecos relevantes:

*   A Fundação Pró-Sangue reconheceu o estudo e sinalizou encaminhamento à TI.
*   A WTotem elogiou a iniciativa e manifestou interesse em discutir melhorias.

Aprendizados da divulgação (Publicações 2 e 3):

1. **Aderência e canal:** Mesmo com boa recepção orgânica, a participação ficou abaixo do esperado. Abrir o acesso mobile foi necessário, mas insuficiente sem reforço de mensagem e contexto.
2. **Momento do feedback:** Mover a avaliação para logo após cada interface aumentou taxa e qualidade das respostas.
3. **CTA de doação:** Reposicionar e reescrever o convite ajudou a investigar se a baixa taxa de cliques era comunicação, contexto ou motivação.

Distribuição do engajamento entre publicações:

*   **Publicação 1** concentrou a maior parte do alcance e do diálogo (≈2.132 impressões, 21 reações e 12 comentários),
    evidenciando a força do contexto e da novidade do projeto.
*   **Publicações 2 e 3** tiveram repercussão substancialmente menor (≈113–117 impressões e 1–2 reações),
    reforçando a necessidade de ajustar mensagem, timing e formato para sustentar o interesse ao longo do tempo.

Referências:

*   [Estatísticas de publicações no LinkedIn](./referencias/estatisticas-linkedin.md)
*   [Publicações no LinkedIn — compilado de texto e reações](./referencias/publicacoes-linkedin-compilado.md)

---

## Discussão e Oportunidades de Melhoria

A combinação dos dados quantitativos e qualitativos oferece um mapa claro para futuras iterações do projeto. As principais oportunidades de melhoria são:

1.  **Adaptar o fluxo para Mobile:** Criar uma experiência guiada para usuários de celular, que representam uma parcela significativa do tráfego.
2.  **Reduzir Cliques Inativos:** Implementar feedback visual imediato, como contadores de dígitos, para informar ao usuário por que um botão está desabilitado.
3.  **Investigar Erros de JavaScript:** Corrigir os erros de "cannot read properties of null (reading 'usestate')" para melhorar a estabilidade e a performance da aplicação.

---

## Conclusão

Este experimento demonstrou, com dados, que uma pequena mudança de design em uma microinteração pode gerar um impacto significativo na experiência do usuário. A nova interface não só se provou mais eficiente, como também foi percebida como mais intuitiva e agradável pelos usuários.

O estudo se encerra com resultados sólidos, um caminho claro para futuras melhorias e um aprendizado que vai além da interface: a importância de combinar dados quantitativos e qualitativos para tomar decisões de design mais informadas. A Fundação Pró-Sangue e a WTotem responderam ao estudo e demonstraram interesse nas descobertas, validando o esforço e abrindo portas para um diálogo produtivo.

O experimento segue aberto para quem quiser conhecer e explorar:
👉 https://bolivaralencastro.github.io/hemocentro-totem-ab-test/


## Conteúdo Relacionado

<!-- RELATED_CONTENT_START -->
### Insights
*   [01-dados-experimento](./insights/01-dados-experimento.md)
*   [Análise de Dados do Clarity](./insights/02-dados-clarity.md)
*   [Análise Cruzada de Dados: Experimento A/B e Comportamento do Usuário](./insights/03-analise-cruzada-de-dados.md)
*   [Como aproveitar os dados do Clarity](./insights/04-oportunidades-de-melhoria-com-clarity.md)
<!-- RELATED_CONTENT_END -->

