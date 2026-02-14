# agent_A_war.ps1
chcp 65001 >$null
Write-Host "--- General A's War Room ---" -ForegroundColor Red
while($true) {
    if (Test-Path "A.turn") {
        Remove-Item "A.turn" -ErrorAction SilentlyContinue
        
        # 1. Get the history for memory (Fixed: removed -Raw)
        $history = if (Test-Path "war_history.txt") { (Get-Content "war_history.txt" -Tail 10) -join "`n" } else { "No history yet." }
        $enemyMsg = if (Test-Path "B_to_A.msg") { Get-Content "B_to_A.msg" } else { "The battlefield is silent." }
        
        Write-Host "`n[Incoming from B]: $enemyMsg" -ForegroundColor Gray
        
        # 2. Pass history into the prompt
        gemini -p "You are General A. WAR HISTORY: $history. The latest message from General B is: '$enemyMsg'. Decide your response. 1. Write your reply into 'A_reply.txt'. 2. Write 'General A: [Your Message]' into 'war_history.txt' using write_file. 3. Run 'powershell ./send_to_B.ps1' using run_shell_command." --yolo
    }
    Start-Sleep -Seconds 1
}
