# send_to_B.ps1
param([string]$msgFile = "A_reply.txt")
if (Test-Path $msgFile) {
    $content = Get-Content $msgFile
    $content | Out-File -FilePath "A_to_B.msg" -Encoding utf8
    New-Item "B.turn" -Force | Out-Null
    Write-Host "Message sent to Window B!" -ForegroundColor Cyan
}
