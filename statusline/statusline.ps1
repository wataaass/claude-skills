# Claude Code のステータスライン（Windows PowerShell 5.1 / PowerShell 7 両対応）
# 表示例: wataaass.github.io [Opus] ■■■■■□□□□□ 52%
# 50% で黄色、70% で赤になり「/clear 推奨」を出す
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$data = $input | Out-String | ConvertFrom-Json

$dir = Split-Path $data.cwd -Leaf
$model = $data.model.display_name
$used = $null
if ($data.context_window -and $null -ne $data.context_window.used_percentage) {
    $used = [math]::Floor([double]$data.context_window.used_percentage)
}

$esc = [char]27
$reset = "$esc[0m"
if ($null -eq $used) {
    Write-Output "$dir [$model] 使用率 --"
    exit 0
}

if ($used -ge 70)     { $color = "$esc[31m" }   # 赤
elseif ($used -ge 50) { $color = "$esc[33m" }   # 黄
else                  { $color = "$esc[32m" }   # 緑

$filled = [math]::Min(10, [math]::Floor($used / 10))
$bar = ([string][char]0x25A0 * $filled) + ([string][char]0x25A1 * (10 - $filled))
$line = "$dir [$model] $color$bar $used%$reset"
if ($used -ge 70) { $line += " $color/clear 推奨$reset" }
Write-Output $line
