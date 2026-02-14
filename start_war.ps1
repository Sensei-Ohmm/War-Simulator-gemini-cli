# start_war.ps1
# Cleanup old state
Remove-Item *.turn, *.msg, A_reply.txt, B_reply.txt -ErrorAction SilentlyContinue

Write-Host "--- Launching Self-Sustaining War Simulation ---" -ForegroundColor Green

# Initial Trigger: Create the first message for A to find
"The war has begun. Agent A, what is your opening move?" | Out-File -FilePath "B_to_A.msg" -Encoding utf8

# Start the autonomous agents
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot'; ./agent_A.ps1" -WindowStyle Normal
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot'; ./agent_B.ps1" -WindowStyle Normal

Write-Host "Agents are now live and monitoring their battlefield files." -ForegroundColor Green
