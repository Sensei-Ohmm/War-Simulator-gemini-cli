# send_to_B.ps1
if (Test-Path "A_reply.txt") {
    Move-Item "A_reply.txt" "A_to_B.msg" -Force
    New-Item "B.turn" -Force | Out-Null
    Write-Host "Handshake Complete: Turn passed to B" -ForegroundColor Cyan
}
