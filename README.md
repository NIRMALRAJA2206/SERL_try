# SERL_try

Practical setup and run guide for SERL simulation.

This repository includes:
- a ready conda environment file (`env/serl_env.yml`)
- SERL as a git submodule (`serl/`)
- helper scripts (`scripts/`)

## 1. Clone the repository (with submodules)

```bash
git clone --recurse-submodules https://github.com/NIRMALRAJA2206/SERL_try.git
cd SERL_try
```

If you already cloned without submodules:

```bash
git submodule update --init --recursive
```

## 2. Install Conda / Miniconda (if not installed)

Check whether conda exists:

```bash
conda --version
```

If `conda` is not found, install Miniconda, then reopen your terminal:
- Linux/macOS: https://docs.conda.io/en/latest/miniconda.html
- Windows: use Miniconda Prompt after installation

## 3. Create and activate the environment

From the repository root:

```bash
conda env create -f env/serl_env.yml
conda activate serl
```

If the environment already exists:

```bash
conda activate serl
```

## 4. Install project dependencies from source

These commands ensure the local SERL code in this repo is used:

```bash
pip install -e serl/serl_launcher
pip install -r serl/serl_launcher/requirements.txt
pip install -e serl/franka_sim
pip install -r serl/franka_sim/requirements.txt
```

Optional (only if manual control complains about `pygame`):

```bash
pip install pygame
```

## 5. Verify basic setup

```bash
python -c "import jax, serl_launcher, franka_sim; print('Setup OK')"
```

## Run Type 1: Async SAC (Learner + Actor)

Use two terminals.

In both terminals:

```bash
cd SERL_try
conda activate serl
cd serl/examples/async_sac_state_sim
```

Terminal 1 (Learner):

```bash
bash run_learner.sh
```

Terminal 2 (Actor):

```bash
bash run_actor.sh
```

Notes:
- Keep both terminals running at the same time.
- The actor window opens with rendering enabled.

## Run Type 2: Manual Control (No Learner/Actor)

```bash
cd SERL_try
conda activate serl
cd serl/examples/async_sac_state_sim
python manual_control.py
```

Manual keys:
- `W/S`: move X+
- `A/D`: move Y
- `R/F`: move Z
- `O/P`: open/close gripper
- `N`: reset
- `ESC`: exit

## Optional: use helper scripts from this repo

Helper scripts are available in `scripts/`, but the direct commands above are the most reliable and easiest to debug.

## Troubleshooting

- `ModuleNotFoundError: serl_launcher`:
  Run the install commands in section 4 again.
- `ModuleNotFoundError: franka_sim`:
  Run `pip install -e serl/franka_sim`.
- Submodule folder is empty:
  Run `git submodule update --init --recursive`.
- `conda: command not found`:
  Install Miniconda and reopen the terminal.
