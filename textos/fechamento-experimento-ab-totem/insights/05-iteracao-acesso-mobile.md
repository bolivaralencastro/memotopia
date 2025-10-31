# Iteração no Acesso Mobile

## A Decisão Inicial: Bloqueio de Mobile

Inicialmente, o experimento foi concebido com uma **trava que impedia usuários em dispositivos móveis de realizar o teste**. Essa decisão foi tomada porque:

- O objetivo do experimento era simular o uso real em um **totem físico** usado para cadastro em hemocentros
- Totens possuem telas touchscreen fixas, operadas em modo vertical, similares a desktops
- Para manter a fidelidade ao contexto de uso real, fazia sentido restringir o teste a ambientes desktop

## A Mudança de Estratégia

Durante a fase de divulgação e coleta de dados, observou-se que uma parcela significativa do tráfego estava vindo de dispositivos móveis. Esse cenário levou a uma **mudança estratégica**: a trava mobile foi removida, permitindo que usuários de celulares também participassem do experimento.

## A Hipótese sobre o Comportamento em Mobile

A decisão de abrir o acesso para mobile foi acompanhada de uma **hipótese específica sobre o comportamento esperado**:

### Hipótese Principal

Nos dispositivos móveis, esperava-se que **ambas as interfaces apresentassem tempos de digitação menores** em relação ao desktop, pois:

- Usuários podem utilizar **ambas as mãos** simultaneamente em smartphones
- A digitação com dois polegares é geralmente mais rápida do que a digitação com uma única mão ou mouse em desktop
- O contexto tátil de teclados touch favorável à rapidez

### Hipótese Secundária

Mesmo com a expectativa de redução de tempo em ambas as versões, a hipótese era que **a nova interface continuaria ganhando em relação à original**, mantendo uma vantagem estatística mesmo no contexto mobile.

## O Resultado

Os dados confirmaram parcialmente as hipóteses:

| Dispositivo | Tempo Médio Original (ms) | Tempo Médio Nova (ms) | Redução Média de Tempo (%) |
|---|---|---|---|
| PC | 120535 | 7534 | 93.75% |
| Mobile | 153394 | 6321 | 95.88% |

### Análise dos Resultados

1. **Tempos Absolutos:** A interface nova apresentou tempos menores em ambos os dispositivos
2. **Redução Percentual:** A vantagem da nova interface foi **maior** em mobile (95.88%) do que em desktop (93.75%)
3. **Tempos Originais:** Ao contrário da hipótese inicial, a interface original teve desempenho **pior** em mobile (153.394ms) comparado ao desktop (120.535ms)

### Interpretação

O fato dos tempos originais serem maiores em mobile sugere que **a interface legada (Versão A) não se adapta bem ao contexto tátil**. O layout de seis colunas e a ausência de segmentação visual podem ter dificultado a digitação com polegares em telas menores.

Por outro lado, a **nova interface (Versão B) conseguiu aproveitar melhor o contexto mobile**, apresentando:
- Teclado em grade 3×4 (layout familiar de calculadora)
- Botões grandes, otimizados para toque
- Segmentação visual do CPF facilitando a verificação durante a digitação

## Aprendizados

Essa iteração revelou que:

1. **Abordagens Iterativas Funcionam:** Ajustar a metodologia durante o experimento, movido por dados observados, trouxe insights valiosos
2. **Contexto Importa:** Design não é neutro ao dispositivo — algumas interfaces se adaptam melhor a diferentes contextos de uso
3. **Hipóteses Podem Ser Parcialmente Confirmadas:** A nova interface ganhou em ambos os contextos, mas de forma mais expressiva em mobile, demonstrando robustez do design

A decisão de remover a trava mobile não apenas ampliou a base de participantes, mas também validou que a nova proposta de interface funciona bem tanto no contexto desktop (destino original) quanto no contexto mobile (contexto de teste).

[Voltar ao Texto Principal](../index.md)

