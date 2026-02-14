# apex_launcher.ps1
# Pure Apex Loop for Agents A and B

$sessionID = "apex_war_$(Get-Date -Format 'yyyyMMdd_HHmm')"
$maxTurns = 10
$turn = 1

# Cleanup and Setup
Remove-Item *.turn, *.msg, A_reply.txt, B_reply.txt, envelope.yaml -ErrorAction SilentlyContinue
"[]" | Out-File -FilePath envelope.yaml -Encoding utf8

Write-Host "--- Launching Apex Protocol: A vs B ---" -ForegroundColor Green
Write-Host "Session ID: $sessionID" -ForegroundColor Gray

# Initial Trigger
"The simulation has begun. A, make your first move." | Out-File -FilePath "B_to_A.msg" -Encoding utf8
New-Item "A.turn" -Force | Out-Null

# Launch Windows
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot'; ./agent_A.ps1 $sessionID" -WindowStyle Normal
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot'; ./agent_B.ps1 $sessionID" -WindowStyle Normal

Write-Host "Both agents are active. Monitor their windows for the conflict." -ForegroundColor Green
