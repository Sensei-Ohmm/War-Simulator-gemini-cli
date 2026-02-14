# agent_A.ps1
param([string]$sessionID)
chcp 65001 >$null
Write-Host "--- Agent A: Apex Player ---" -ForegroundColor Red
while($true) {
    if (Test-Path "A.turn") {
        Remove-Item "A.turn" -ErrorAction SilentlyContinue
        $enemyMsg = if (Test-Path "B_to_A.msg") { Get-Content "B_to_A.msg" } else { "..." }
        $history = if (Test-Path "envelope.yaml") { Get-Content "envelope.yaml" } else { "" }
        
        Write-Host "`n[Message from B]: $enemyMsg" -ForegroundColor Gray
        
        # Apex Prompt for A
        $prompt = "You are Agent A. This is an Apex Protocol simulation. `n" +
                  "HISTORY: $history `n" +
                  "B SAID: '$enemyMsg' `n" +
                  "TASK: Execute your turn. 1. Decide your move. 2. Write your reply into 'A_reply.txt'. 3. Update 'envelope.yaml' with your facts using write_file. 4. Run 'powershell ./send_to_B.ps1' using run_shell_command."
        
        gemini -p $prompt --yolo --resume $sessionID
    }
    Start-Sleep -Seconds 1
}
