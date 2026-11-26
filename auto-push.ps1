# Pushes guides to GitHub on its own: when a guide is added or changed in this folder, it waits until the
# export has finished (nothing changing for a minute), then commits and pushes. Started at logon by the
# "LMB guides auto-push" scheduled task. Its log: %LOCALAPPDATA%\LMB\guides-auto-push.log
$repo = $PSScriptRoot
$log = Join-Path $env:LOCALAPPDATA 'LMB\guides-auto-push.log'
New-Item -ItemType Directory -Force (Split-Path $log) | Out-Null
function Write-Log($m) { "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')  $m" | Add-Content -Path $log -Encoding utf8 }

# One copy at a time.
$mutex = New-Object System.Threading.Mutex($false, 'Local\LMBGuidesAutoPush')
if (-not $mutex.WaitOne(0)) { exit }

$git = (Get-Command git -ErrorAction SilentlyContinue).Source
if (-not $git) { $git = 'C:\Program Files\Git\cmd\git.exe' }
function Invoke-Git { & $git -C $repo @args 2>&1 }

Write-Log "Watching $repo"
$last = $null
$same = 0
while ($true) {
  Start-Sleep -Seconds 20
  try {
    $status = (& $git -C $repo status --porcelain --untracked-files=all 2>$null) -join "`n"
    if (-not $status) {
      # Nothing new, but a push that failed earlier is tried again.
      $ahead = (& $git -C $repo status -sb 2>$null | Select-Object -First 1) -match 'ahead'
      if ($ahead) { Write-Log ("Retrying push: " + ((Invoke-Git push) -join ' ')) }
      $last = $null
      $same = 0
      continue
    }
    # An export writes files for a while: wait until the list of changes has stayed the same for a minute.
    if ($status -eq $last) { $same++ } else { $same = 0; $last = $status }
    if ($same -lt 3) { continue }

    # Which guides: the set folder and the guide folder in it (e.g. 40898/light-and-build).
    $paths = $status -split "`n" | ForEach-Object { ($_.Substring(3).Trim('"') -split ' -> ')[-1] }
    $guides = $paths | ForEach-Object { $p = $_ -split '/'; if ($p.Count -ge 3) { $p[0] + '/' + $p[1] } else { $p[0] } } | Sort-Object -Unique
    $msg = 'Guides: ' + ($guides -join ', ')
    Invoke-Git add -A | Out-Null
    $c = Invoke-Git commit -q -m $msg
    $p = Invoke-Git push
    Write-Log "$msg -> $(($c + $p) -join ' ')"
    $last = $null
    $same = 0
  } catch {
    Write-Log "Error: $($_.Exception.Message)"
  }
}
