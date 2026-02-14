# agent_A.ps1
param([string]$sessionID)
chcp 65001 >$null
Write-Host "--- Agent A: Persistent War Room ---" -ForegroundColor Red

# Initial Setup Prompt to define the personality and rules
$setupPrompt = "You are Agent A, the Red Commander. This is a persistent War Simulation. `n" +
               "Rules: 1. You will stay in this window. 2. When it is your turn, you will see a message from B. `n" +
               "3. You must decide your move, write it to 'A_reply.txt', and run 'powershell ./send_to_B.ps1'. `n" +
               "Stay alert. History is now remembered in this window."

# Start the interactive session and wait for turns
gemini -i $setupPrompt --yolo --resume $sessionID

# Note: The agent will now live inside the interactive prompt. 
# It will see turns as you/the script inputs them into the session.
