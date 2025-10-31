# Como aproveitar os dados do Clarity

As métricas mostram que há tráfego consistente (207 sessões, 167 usuários únicos) e uma boa profundidade de rolagem (≈98%), mas também revelam fricções — 47,8 % das sessões vêm de mobile, 11 % dos cliques são “inativos” e há erros de JavaScript registrados. Isso oferece várias oportunidades de melhoria.

## Oportunidades de melhoria guiadas pelas métricas

### Adaptar o fluxo para mobile, não apenas desktop

Quase metade dos acessos acontece em celulares, porém o projeto nasceu como um teste pensado para totem/desktop, a ponto de existir um aviso de bloqueio a mobile que hoje está comentado. Reativar uma experiência guiada para mobile (por exemplo, exibindo uma versão reduzida ou instruções específicas ao detectar isMobile()) evita frustração e pode aumentar o engajamento desse público, sem quebrar o teste original para desktop.

### Reduzir “cliques inativos” com feedback imediato

O botão “CONTINUAR” na versão A e o botão “OK” na versão B permanecem desativados até que os 11 dígitos do CPF sejam preenchidos. Muitos usuários tentam clicar antes disso, o que gera os 11 % de “clique inativo”. Você pode usar os dados do Clarity para validar uma melhoria visual (por exemplo, mostrar contadores de dígitos restantes ou mensagens de alerta) e, depois da mudança, acompanhar se o indicador cai.

### Priorizar melhorias com base no momento do abandono

As páginas de entrada e saída são praticamente as mesmas, o que indica que a maior parte dos participantes abandona o teste sem concluir todos os passos. Instrumentar os eventos de submitFeedback e dos componentes de teste (via Clarity ou telemetria própria) ajuda a mapear exatamente em qual etapa ocorre a desistência para orientar ajustes de conteúdo ou de fluxo.

### Investigar o erro de JavaScript “cannot read properties of null (reading 'usestate')”

Mesmo que o projeto seja Angular, o Clarity registrou esse erro em 7 sessões. Isso pode estar relacionado a embeds externos ou scripts auxiliares. Monitorar quando o erro aparece (por exemplo, cruzando com a fonte github.dev ou localhost) e corrigi-lo melhora a pontuação de desempenho e evita que sessões sejam interrompidas.

## Como medir a evolução

Depois de aplicar melhorias, configure segmentos no Clarity para comparar:

*   Taxa de cliques inativos antes/depois das mudanças.
*   Evolução da intenção (Low/Medium/High) por dispositivo.
*   Distribuição de erros de JavaScript.

Esses indicadores vão mostrar se as alterações realmente elevam a qualidade da experiência e sustentam o objetivo do projeto.

[Voltar ao Texto Principal](../index.md)
