# start_war.ps1
# Clean up old state
Remove-Item *.turn, *.msg, A_reply.txt, B_reply.txt, war_history.txt -ErrorAction SilentlyContinue

# Initialize the first turn
"The war begins today. Surrender now or be crushed." | Out-File -FilePath "B_to_A.msg" -Encoding utf8
New-Item "A.turn" -Force | Out-Null

Write-Host "Launching the War..." -ForegroundColor Green

# Start Window A
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot'; ./agent_A_war.ps1" -WindowStyle Normal

# Start Window B
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot'; ./agent_B_war.ps1" -WindowStyle Normal
