Param(
    [Parameter(Mandatory=$true)][string]$TextDir,
    [Parameter(Mandatory=$true)][string]$Title,
    [string]$Autor,
    [string]$Link
)

$Base = Join-Path "textos" (Join-Path $TextDir "referencias")
if (!(Test-Path $Base)) { Write-Error "Diretório não encontrado: $Base"; exit 1 }

$nums = Get-ChildItem -Path $Base -Filter 'ref*.md' | ForEach-Object {
    if ($_.BaseName -match '^ref(\d+)$') { [int]$matches[1] } else { $null }
} | Where-Object { $_ -ne $null }
$next = if ($nums.Count -gt 0) { [int]([Enumerable]::Max($nums)) + 1 } else { 1 }
$name = "ref$next.md"
$file = Join-Path $Base $name
if (Test-Path $file) { Write-Error "Arquivo já existe: $file"; exit 1 }

$meta = @()
if ($Autor) { $meta += "Autor: $Autor" }
if ($Link)  { $meta += "Link: $Link" }
$metaBlock = if ($meta.Count -gt 0) { ($meta -join "`n") + "`n" } else { "" }

$content = @"
---
# $Title
---

${metaBlock}Notas: 

[Voltar ao Texto Principal](../index.md)
"@
Set-Content -LiteralPath $file -Value $content -NoNewline:$false -Encoding UTF8
Write-Host "📚 Referência criada: $file"

