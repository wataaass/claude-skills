# ステータスラインを入れるスクリプト。PowerShell で次のように実行する:
#   powershell -ExecutionPolicy Bypass -File .\install.ps1
$ErrorActionPreference = "Stop"
$claudeDir = Join-Path $HOME ".claude"
New-Item -ItemType Directory -Force -Path $claudeDir | Out-Null

# 1. スクリプトを ~/.claude にコピーする
$target = Join-Path $claudeDir "statusline.ps1"
Copy-Item -Force (Join-Path $PSScriptRoot "statusline.ps1") $target

# 2. settings.json に statusLine を足す（既存の設定は残し、元のファイルは .bak に残す）
$settingsPath = Join-Path $claudeDir "settings.json"
if (Test-Path $settingsPath) {
    Copy-Item -Force $settingsPath "$settingsPath.bak"
    $raw = Get-Content -Raw -Encoding UTF8 $settingsPath
    if ($raw.Trim()) { $settings = $raw | ConvertFrom-Json } else { $settings = New-Object PSObject }
} else {
    $settings = New-Object PSObject
}
# Git Bash 経由で実行されてもパスが壊れないよう、区切りを / にする
$path = $target -replace '\\', '/'
$statusLine = [PSCustomObject]@{
    type    = "command"
    command = "powershell -NoProfile -ExecutionPolicy Bypass -File $path"
}
$settings | Add-Member -Force -NotePropertyName statusLine -NotePropertyValue $statusLine
$json = $settings | ConvertTo-Json -Depth 20
[System.IO.File]::WriteAllText($settingsPath, $json, (New-Object System.Text.UTF8Encoding $false))

Write-Output "入れました: $target"
Write-Output "設定しました: $settingsPath（元のファイルは settings.json.bak）"
Write-Output "Claude Code を起動し直すと、画面下に使用率が出ます。"
