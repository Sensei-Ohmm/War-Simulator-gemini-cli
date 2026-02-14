# agent_B.ps1
param([string]$sessionID)
chcp 65001 >$null
Write-Host "--- Agent B: Persistent War Room ---" -ForegroundColor Blue

# Initial Setup Prompt
$setupPrompt = "You are Agent B, the Blue Commander. This is a persistent War Simulation. `n" +
               "Rules: 1. You will stay in this window. 2. When it is your turn, you will see a message from A. `n" +
               "3. You must decide your move, write it to 'B_reply.txt', and run 'powershell ./send_to_A.ps1'. `n" +
               "Stay alert. History is now remembered in this window."

gemini -i $setupPrompt --yolo --resume $sessionID
