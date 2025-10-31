Param(
    [Parameter(Mandatory=$true)][string]$TextDir,
    [Parameter(Mandatory=$true)][string]$Title
)

$Base = Join-Path "textos" (Join-Path $TextDir "insights")
if (!(Test-Path $Base)) { Write-Error "Diretório não encontrado: $Base"; exit 1 }

# slug simples
$slug = ($Title.ToLower() -replace '[^a-z0-9 ]','' -replace ' +','-' ).Trim('-')

# próximo número
$nums = Get-ChildItem -Path $Base -Filter '*.md' | ForEach-Object {
    if ($_.BaseName -match '^(\d+)-') { [int]$matches[1] } else { $null }
} | Where-Object { $_ -ne $null }
$next = if ($nums.Count -gt 0) { [int]([Enumerable]::Max($nums)) + 1 } else { 1 }
$name = ("{0:d2}-{1}.md" -f $next, $slug)
$file = Join-Path $Base $name
if (Test-Path $file) { Write-Error "Arquivo já existe: $file"; exit 1 }

$content = @"
---
# $Title
---

- Escreva aqui o insight.

[Voltar ao Texto Principal](../index.md)
"@
Set-Content -LiteralPath $file -Value $content -NoNewline:$false -Encoding UTF8
Write-Host "📝 Insight criado: $file"

