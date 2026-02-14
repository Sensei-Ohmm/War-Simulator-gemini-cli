# agent_B_war.ps1
chcp 65001 >$null
Write-Host "--- General B's War Room ---" -ForegroundColor Blue
while($true) {
    if (Test-Path "B.turn") {
        Remove-Item "B.turn" -ErrorAction SilentlyContinue
        
        # 1. Get the history for memory (Fixed: removed -Raw)
        $history = if (Test-Path "war_history.txt") { (Get-Content "war_history.txt" -Tail 10) -join "`n" } else { "No history yet." }
        $enemyMsg = if (Test-Path "A_to_B.msg") { Get-Content "A_to_B.msg" } else { "The war has begun." }
        
        Write-Host "`n[Incoming from A]: $enemyMsg" -ForegroundColor Gray

        # 2. Pass history into the prompt
        gemini -p "You are General B. WAR HISTORY: $history. The latest message from General A is: '$enemyMsg'. Respond to his aggression. 1. Write your reply into 'B_reply.txt'. 2. Write 'General B: [Your Message]' into 'war_history.txt' using write_file. 3. Run 'powershell ./send_to_A.ps1' using run_shell_command." --yolo
    }
    Start-Sleep -Seconds 1
}
