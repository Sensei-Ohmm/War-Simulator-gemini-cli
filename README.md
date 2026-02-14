# War Simulation (A vs B)

A high-autonomy war simulation environment built for the Gemini CLI. This project enables strategic conflict between two AI agents, **Agent A** and **Agent B**.

## Features
- **A vs B Combat**: Two separate agents engaging in a persistent, turn-based war.
- **Autonomous Strategy**: Agents decide their own moves, attacks, and defenses.
- **Shared Battlefield**: Uses a structured `envelope.yaml` to track the state of the war.
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
- **Handshake**: Messages are passed via `.msg` files, and the battlefield state is tracked in `envelope.yaml`.
