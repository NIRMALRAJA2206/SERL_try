# SERL_try
SERL: A Software Suite for Sample-Efficient Robotic Reinforcement Learning

This guide documents how to set up and run the SERL simulation on Ubuntu 22.04 using the `serl` conda environment, and how to launch:
- Async SAC with separate learner/actor terminals
- Manual control (no learner/actor)

## Prerequisites (Ubuntu 22.04)
1. System packages
   ```bash
   sudo apt update
   sudo apt install -y git build-essential
   ```
2. Miniconda/Conda installed and available in your shell

## Clone SERL
```bash
mkdir -p /home/karuppia/serl_ws
cd /home/karuppia/serl_ws
git clone https://github.com/rail-berkeley/serl.git
```

## Create the conda environment
If you already have a `serl` environment, you can skip this section.

Option A (recommended if you have an environment YAML):
```bash
conda env create -n serl -f /home/karuppia/serl_ws/serl_env.yml
```

Option B (manual create):
```bash
conda create -n serl python=3.10 -y
conda activate serl
pip install -r /home/karuppia/serl_ws/serl/requirements.txt
```

## Install runtime dependency
```bash
conda activate serl
pip install pygame
```

## Workspace layout used below
The following commands assume your SERL workspace is at:
```
/home/karuppia/serl_ws/serl_sim_ws/src/serl/examples/async_sac_state_sim
```

Adjust paths if your workspace is located elsewhere.

## Run Type 1: Async SAC (learner + actor)
Open two terminals.

### Terminal 1 (learner)
```bash
export JAX_PLATFORMS=cpu
export PYTHONNOUSERSITE=1
export WANDB_MODE=disabled
cd /home/karuppia/serl_ws/serl_sim_ws/src/serl/examples/async_sac_state_sim
python async_sac_state_sim.py --learner --env PandaPickCube-v0 --debug
```

### Terminal 2 (actor)
```bash
source /home/karuppia/serl_ws/serl_sim_ws/miniconda3/bin/activate serl
export JAX_PLATFORMS=cpu
export PYTHONNOUSERSITE=1
cd /home/karuppia/serl_ws/serl_sim_ws/src/serl/examples/async_sac_state_sim
python async_sac_state_sim.py --actor --env PandaPickCube-v0 --render --debug
```

## Run Type 2: Manual control (no learner/actor)
```bash
conda activate serl
export JAX_PLATFORMS=cpu
export PYTHONNOUSERSITE=1
cd /home/karuppia/serl_ws/serl_sim_ws/src/serl/examples/async_sac_state_sim
python manual_control.py
```

### Manual control keys
- `W/S`: X+, X-
- `A/D`: Y-, Y+
- `R/F`: Z+, Z-
- `O/P`: gripper open/close
- `N`: reset
- `ESC`: quit
