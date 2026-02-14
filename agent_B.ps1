# agent_B.ps1
param([string]$sessionID)
chcp 65001 >$null
Write-Host "--- Agent B: Apex Player ---" -ForegroundColor Blue
while($true) {
    if (Test-Path "B.turn") {
        Remove-Item "B.turn" -ErrorAction SilentlyContinue
        $enemyMsg = if (Test-Path "A_to_B.msg") { Get-Content "A_to_B.msg" } else { "..." }
        $history = if (Test-Path "envelope.yaml") { Get-Content "envelope.yaml" } else { "" }
        
        Write-Host "`n[Message from A]: $enemyMsg" -ForegroundColor Gray

        # War Simulation Prompt for B
        $prompt = "You are Agent B. This is a War Simulation. `n" +
                  "BATTLEFIELD STATE: $history `n" +
                  "A SAID: '$enemyMsg' `n" +
                  "TASK: Execute your turn. 1. Decide your move. 2. Write your reply into 'B_reply.txt'. 3. Update 'envelope.yaml' with the current state of the war using write_file. 4. Run 'powershell ./send_to_A.ps1' using run_shell_command."

        gemini -p $prompt --yolo --resume $sessionID
    }
    Start-Sleep -Seconds 1
}
