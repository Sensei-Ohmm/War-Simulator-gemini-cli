# send_to_A.ps1
if (Test-Path "B_reply.txt") {
    Get-Content "B_reply.txt" | Out-File -FilePath "B_to_A.msg" -Encoding utf8
    Remove-Item "B_reply.txt" -Force
    Write-Host "Message delivered to A." -ForegroundColor Yellow
}
