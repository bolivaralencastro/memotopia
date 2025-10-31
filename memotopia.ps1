Param(
  [Parameter(Mandatory=$false)][string]$Cmd,
  [Parameter(ValueFromRemainingArguments=$true)][string[]]$Args
)

function Show-Help {
  Write-Host "Uso: pwsh -File .\\memotopia.ps1 <subcomando> [args]"
  Write-Host "Subcomandos:"
  Write-Host "  new <nome>                 Cria um novo texto (PowerShell)."
  Write-Host "  insight <texto> \"Título\"  Cria insight numerado (PowerShell)."
  Write-Host "  ref <texto> \"Título\" [-Autor] [-Link]  Cria referência (PowerShell)."
  Write-Host "  update-nav                 Atualiza navegação (requer Git Bash)."
  Write-Host "  push [\"mensagem\"]         Git add/commit/pull --rebase/push (requer Git Bash)."
}

if (-not $Cmd) { Show-Help; exit 1 }

switch ($Cmd) {
  'new' {
    if (-not $Args -or $Args.Count -lt 1) { Write-Error "Use: new <nome>"; exit 1 }
    pwsh -File .\memotopia-new.ps1 $Args[0]
  }
  'insight' {
    if (-not $Args -or $Args.Count -lt 2) { Write-Error "Use: insight <texto> \"Título\""; exit 1 }
    pwsh -File .\memotopia-insight.ps1 -TextDir $Args[0] -Title $Args[1]
  }
  'ref' {
    if (-not $Args -or $Args.Count -lt 2) { Write-Error "Use: ref <texto> \"Título\" [-Autor Nome] [-Link URL]"; exit 1 }
    # Parse simples de switches -Autor/-Link
    $text = $Args[0]
    $title = $Args[1]
    $autor = $null
    $link = $null
    for ($i=2; $i -lt $Args.Count; $i++) {
      if ($Args[$i] -eq '-Autor' -and ($i+1) -lt $Args.Count) { $autor = $Args[$i+1]; $i++ }
      elseif ($Args[$i] -eq '-Link' -and ($i+1) -lt $Args.Count) { $link = $Args[$i+1]; $i++ }
    }
    $psArgs = @('-TextDir', $text, '-Title', $title)
    if ($autor) { $psArgs += @('-Autor', $autor) }
    if ($link)  { $psArgs += @('-Link', $link) }
    pwsh -File .\memotopia-ref.ps1 @psArgs
  }
  'update-nav' {
    $bash = "C:\\Program Files\\Git\\bin\\bash.exe"
    if (-not (Test-Path $bash)) { Write-Error "Git Bash não encontrado em '$bash'. Instale o Git for Windows ou rode via WSL."; exit 1 }
    & $bash ./memotopia-update-nav.sh
  }
  'push' {
    $bash = "C:\\Program Files\\Git\\bin\\bash.exe"
    if (-not (Test-Path $bash)) { Write-Error "Git Bash não encontrado em '$bash'. Instale o Git for Windows ou rode via WSL."; exit 1 }
    if ($Args -and $Args.Count -ge 1) { & $bash ./memotopia-push.sh $Args[0] } else { & $bash ./memotopia-push.sh }
  }
  Default { Show-Help; exit 1 }
}

