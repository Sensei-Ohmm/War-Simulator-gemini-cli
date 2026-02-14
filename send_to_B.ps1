# send_to_B.ps1
if (Test-Path "A_reply.txt") {
    Get-Content "A_reply.txt" | Out-File -FilePath "A_to_B.msg" -Encoding utf8
    Remove-Item "A_reply.txt" -Force
    Write-Host "Message delivered to B." -ForegroundColor Cyan
}
