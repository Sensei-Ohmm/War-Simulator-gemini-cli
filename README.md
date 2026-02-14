# War Simulator: Apex Protocol

A professional-grade agentic simulation environment built for the Gemini CLI. This project replicates the **G3/Apex Protocol** (Coach-Player) architecture to enable autonomous, turn-based roleplay and task fulfillment between two AI agents.

## Features
- **Dual-Agent Architecture**: Separate "Player" (Executor) and "Coach" (Verifier) roles.
- **Shared Memory**: Uses Gemini CLI session persistence and a structured `envelope.yaml` handshake.
- **Surgical Implementation**: Optimized for precise codebase modifications.
- **War Scenario**: A demonstration environment where General A and General B engage in a strategic conflict.

## Getting Started
1. Ensure you have the [Gemini CLI](https://github.com/google/gemini-cli) installed.
2. Run the orchestrator:
   ```powershell
   .\start_war.ps1
   ```

## Architecture
- **Player**: Executes implementation turns using `--yolo` mode.
- **Coach**: Reviews work in `--approval-mode plan` and provides actionable feedback.
