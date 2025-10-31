Param(
    [Parameter(Mandatory=$true)][string]$Titulo
)

$Base = Join-Path "textos" $Titulo
$insights = Join-Path $Base "insights"
$refs = Join-Path $Base "referencias"
$assets = Join-Path $Base "assets"

New-Item -ItemType Directory -Force -Path $insights | Out-Null
New-Item -ItemType Directory -Force -Path $refs | Out-Null
New-Item -ItemType Directory -Force -Path $assets | Out-Null

# Título: substituir '-' por espaço e capitalizar cada palavra
$TitlePretty = ($Titulo -replace '-', ' ') -split ' ' | ForEach-Object { if ($_.Length -gt 0) { $_.Substring(0,1).ToUpper() + $_.Substring(1) } } | ForEach-Object { $_ } -join ' '

$indexPath = Join-Path $Base "index.md"
$indexContent = @"
---
# $TitlePretty

Texto inicial da Memotopia chamado **$Titulo**.
Aqui você pode começar a escrever a ideia central, narrativa ou reflexão.
"@
Set-Content -LiteralPath $indexPath -Value $indexContent -NoNewline:$false -Encoding UTF8

$estiloPath = Join-Path $Base "estilo.yml"
$estiloContent = @" 
voz: reflexiva
ritmo: fluido
metaforas: "jardim, oficina, mente viva"
"@
Set-Content -LiteralPath $estiloPath -Value $estiloContent -NoNewline:$false -Encoding UTF8

$insight1 = Join-Path $insights "01-primeiro-insight.md"
$insightContent = @"
---
# Insight Inicial
---

- Insight inicial: todo texto nasce como uma semente.

[Voltar ao Texto Principal](../index.md)
"@
Set-Content -LiteralPath $insight1 -Value $insightContent -NoNewline:$false -Encoding UTF8

$ref1 = Join-Path $refs "ref1.md"
$refContent = @"
---
# Referência Simbólica
---

Autor: Exemplo
Link: https://example.com
Notas: referência inicial para $Titulo

[Voltar ao Texto Principal](../index.md)
"@
Set-Content -LiteralPath $ref1 -Value $refContent -NoNewline:$false -Encoding UTF8

New-Item -ItemType File -Force -Path (Join-Path $assets ".gitkeep") | Out-Null

Write-Host "🌱 Texto '$Titulo' criado com sucesso!"

