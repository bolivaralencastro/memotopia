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

### Fluxo da Jornada do Usuário

A jornada foi estruturada para garantir a neutralidade dos resultados e a consistência da coleta de dados:

- **Sorteio e Início:** A tela inicial convidava o participante a melhorar o totem, reforçava a política de privacidade (nenhuma informação pessoal coletada) e, ao clicar em "Começar Teste", sorteava automaticamente a ordem de exibição das interfaces (A→B ou B→A).
- **Execução dos Testes:** O sistema capturava tempo gasto e quantidade de erros (toques de correção/backspace) em cada interface, registrando qual versão foi concluída.
- **Coleta de Feedback:** Após cada cenário, o participante avaliava a interface com uma nota de 1 a 5 e um comentário opcional, garantindo uniformidade na coleta de dados subjetivos.
- **Encerramento e Engajamento:** A tela final agradecia a participação, exibia métricas comparativas dos tempos de conclusão e apresentava um *call to action* convidando a abrir um painel com hemocentros próximos — cliques registrados como evento de engajamento pós-teste.

A arquitetura utilizava uma **Máquina de Estados Reativa** (via *signals* e *computed properties*) para controlar automaticamente a transição entre estados (Welcome, Teste, Feedback, Finished), registrando métricas antes de avançar para a próxima etapa.

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
*   **Perfil de Acesso:** Quase metade dos acessos (47,8%) vieram de dispositivos móveis durante a fase de coleta de dados. O experimento inicialmente bloqueava acesso mobile, mas a trava foi removida ao observar o volume de tráfego — uma decisão metodológica que trouxe insights valiosos sobre o comportamento das interfaces em diferentes contextos (ver [Iteração no Acesso Mobile](./insights/05-iteracao-acesso-mobile.md)).
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

1. **Aderência e canal:** Mesmo com boa recepção orgânica, a participação ficou abaixo do esperado. Inicialmente, o experimento havia sido configurado com uma trava que bloqueava acesso via mobile, já que o foco era simular o uso real em totens físicos. Observando que parte significativa do tráfego vinha de dispositivos móveis, a trava foi removida — uma decisão que trouxe insights valiosos sobre o comportamento da nova interface em diferentes contextos de uso. Essa abertura ajudou a ampliar a base de participantes, embora o reforço de mensagem e contexto ainda fosse necessário.
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

## Divulgação em Grupos (WhatsApp) e Conversão

Para ampliar a base de participantes, o experimento também foi divulgado em quatro grupos do WhatsApp, testando variações de mensagem e contexto. O desempenho variou conforme o tipo de comunidade e proximidade com o tema.

Resumo dos resultados:

*   **Alcance potencial somado:** 1.671 pessoas
*   **Grupos com reação direta:** 3 de 4
*   **Melhor retorno:** Grupo de vizinhança (Moradores do Contemporâneo Jardins) — gerou respostas e compartilhamento espontâneo para profissionais da saúde
*   **Recepção discreta:** Grupos mais técnicos (dizAI! e Clube de Agências RD) apresentaram baixo engajamento e provável taxa de clique próxima de 1%

Aprendizados das mensagens:

1. **Tom e proximidade importam:** Linguagem pessoal e contexto comunitário elevaram a adesão (JAM+ e grupo de vizinhança).
2. **Clareza do pedido:** Frisar duração curta (menos de 1 minuto) e impacto prático aumentou a disposição em participar.
3. **Ajuste por público:** Mensagens muito técnicas reduziram conversão em grupos numerosos mas heterogêneos.

Referência:

*   [Desempenho das publicações em grupos — WhatsApp](./referencias/grupos-whatsapp.md)

---

## Discussão e Reflexões sobre o Projeto

Este experimento revelou aprendizados que transcendem os resultados numéricos e oferecem insights valiosos para projetos futuros de design de interfaces:

### Sobre a Metodologia

O uso de uma Máquina de Estados Reativa garantiu a neutralidade do teste, já que a ordem de exibição das interfaces (A→B ou B→A) foi aleatória para cada participante. Isso eliminou vieses decorrentes da ordem de apresentação e permitiu que as métricas coletadas refletissem verdadeiramente a diferença entre os designs, não fatores externos. A instrumentação analítica via Clarity complementou os dados objetivos, revelando comportamentos sutis como cliques inativos (11% do total), que indicavam confusão sobre botões desabilitados.

### Sobre a Divulgação e Engajamento

Embora o experimento tenha sido projetado para simular o uso real em um totem físico (em ambientes desktop), quase metade dos acessos (47,8%) vieram de dispositivos móveis durante a fase de coleta de dados. 

Inicialmente, o experimento possuía uma trava bloqueando acesso mobile para manter a fidelidade ao contexto de uso real. Observando o volume de tráfego mobile, a decisão foi **remover a trava e abrir o acesso** — uma mudança metodológica que trouxe hipóteses interessantes: esperava-se que ambos os layouts teriam tempos menores em mobile (devido ao uso de duas mãos), mas que a nova interface manteria vantagem. Os resultados confirmaram: a nova interface ganhou em ambos os contextos, com vantagem **maior** em mobile (95,88%) do que em desktop (93,75%).

Esse dado revelou a importância de considerar o contexto de divulgação ao desenhar estudos públicos: mesmo quando o foco é um dispositivo específico, é necessário criar uma experiência que funcione em múltiplos cenários de acesso. A abordagem iterativa também demonstrou valor — ajustar metodologia com base em dados observados trouxe insights que não estariam disponíveis no desenho inicial.

A divulgação no LinkedIn e WhatsApp trouxe validação social importante — ambas a Fundação Pró-Sangue e a WTotem manifestaram interesse — mas também ensinou sobre os limites de canais orgânicos: das 2.362 impressões no LinkedIn, apenas 19 acessos efetivos foram registrados, e das mensagens enviadas para grupos de WhatsApp, a taxa de conversão variou significativamente conforme o tom e a proximidade da audiência com o tema.

### Sobre a Tomada de Decisão Orientada por Dados

Os resultados quantitativos (redução de 93% a 95% no tempo de digitação) foram validados pelos feedbacks qualitativos (maior percepção de familiaridade e intuitividade), demonstrando que uma pequena mudança de design pode gerar impacto mensurável. Para um hemocentro, onde cada segundo economizado na etapa de cadastro se multiplica pelo número de doadores diários, a escolha da interface mais eficiente tem impacto operacional real.

### Limitações e Próximos Passos

Embora o estudo tenha alcançado seus objetivos, algumas limitações ficaram claras: 7 erros de JavaScript foram registrados durante as sessões, indicando necessidade de melhorias na robustez da aplicação. Além disso, o sucesso em atrair stakeholders relevantes (Fundação Pró-Sangue, WTotem) sugere que o próximo passo natural seria validar a implementação da nova interface em um ambiente de produção real, observando comportamento e métricas de uso efetivo em totens físicos.

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
*   [Iteração no Acesso Mobile: Hipótese e Resultados](./insights/05-iteracao-acesso-mobile.md)
*   [Análise Temporal: Sessões Diárias e Impacto das Campanhas](./insights/06-analise-temporal-campanhas.md)
<!-- RELATED_CONTENT_END -->

