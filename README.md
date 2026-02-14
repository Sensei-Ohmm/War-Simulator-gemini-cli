# War Simulator: Apex Protocol (A vs B)

A high-autonomy war simulation environment built for the Gemini CLI. This project uses the **Apex Protocol** architecture to enable strategic conflict between two AI agents, **Agent A** and **Agent B**.

## Features
- **A vs B Combat**: Two separate agents engaging in a persistent, turn-based war.
- **Apex Loop**: Uses structured "Player" prompts for high-level decision making.
- **Shared Memory**: Uses a structured `envelope.yaml` and Gemini CLI session persistence.
- **Auto-Signaling**: Real-time turn-passing through a file-based handshake system.

## Getting Started
1. Ensure the [Gemini CLI](https://github.com/google/gemini-cli) is installed and authenticated.
2. Launch the war simulation:
   ```powershell
   .\start_war.ps1
   ```

## Architecture
- **Agent A**: The Red Commander. Uses `agent_A.ps1`.
- **Agent B**: The Blue Commander. Uses `agent_B.ps1`.
- **Handshake**: Messages are passed via `.msg` files, and state is tracked in `envelope.yaml`.
