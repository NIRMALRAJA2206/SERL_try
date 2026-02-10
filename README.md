# SERL_try
SERL: A Software Suite for Sample-Efficient Robotic Reinforcement Learning

This repo provides a clean Ubuntu 22.04 guide and ready-to-run scripts for SERL simulation.

## What’s included here
- `env/serl_env.yml`: conda environment file
- `requirements/serl_launcher_requirements.txt`: upstream SERL launcher dependencies
- `requirements/franka_sim_requirements.txt`: upstream franka_sim dependencies
- `scripts/`: runnable helper scripts for setup and execution

## Step-by-step setup (Ubuntu 22.04)
1. Install system packages.
   ```bash
   sudo apt update
   sudo apt install -y git build-essential
   ```
2. Install Miniconda or Anaconda (one-time), then ensure `conda` works in your shell.
   ```bash
   conda --version
   ```
3. Clone the SERL source repo (kept external).
   ```bash
   mkdir -p "$HOME/serl_ws"
   cd "$HOME/serl_ws"
   git clone https://github.com/rail-berkeley/serl.git
   ```
4. Create the `serl` conda environment from the provided file.
   ```bash
   conda env create -n serl -f "$HOME/serl_ws/SERL_try/env/serl_env.yml"
   ```
5. Activate the environment.
   ```bash
   conda activate serl
   ```
6. Install runtime dependency used by manual control.
   ```bash
   pip install pygame
   ```

## Run Type 1: Async SAC (learner + actor)
Open two terminals.

Terminal 1 (learner):
```bash
conda activate serl
   "$HOME/serl_ws/SERL_try/scripts/run_learner.sh"
```

Terminal 2 (actor):
```bash
conda activate serl
   "$HOME/serl_ws/SERL_try/scripts/run_actor.sh"
```

## Run Type 2: Manual control (no learner/actor)
```bash
conda activate serl
 "$HOME/serl_ws/SERL_try/scripts/run_manual.sh"
```

## Manual control keys
- `W/S`: X+, X-
- `A/D`: Y-, Y+
- `R/F`: Z+, Z-
- `O/P`: gripper open/close
- `N`: reset
- `ESC`: quit

## Notes
- All scripts assume the SERL workspace exists at `$HOME/serl_ws/serl_sim_ws/src/serl/examples/async_sac_state_sim`.
- If your paths differ, edit the scripts in `scripts/` accordingly.
