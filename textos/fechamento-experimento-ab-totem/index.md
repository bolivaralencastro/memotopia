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