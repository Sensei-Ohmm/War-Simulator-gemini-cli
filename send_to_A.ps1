# send_to_A.ps1
param([string]$msgFile = "B_reply.txt")
if (Test-Path $msgFile) {
    $content = Get-Content $msgFile
    $content | Out-File -FilePath "B_to_A.msg" -Encoding utf8
    New-Item "A.turn" -Force | Out-Null
    Write-Host "Message sent to General A!" -ForegroundColor Green
}