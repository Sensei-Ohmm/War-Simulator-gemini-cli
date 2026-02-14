# send_to_A.ps1
if (Test-Path "B_reply.txt") {
    Move-Item "B_reply.txt" "B_to_A.msg" -Force
    New-Item "A.turn" -Force | Out-Null
    Write-Host "Handshake Complete: Turn passed to A" -ForegroundColor Yellow
}
