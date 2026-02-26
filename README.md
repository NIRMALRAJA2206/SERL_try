# SERL_try

Fresh Ubuntu 22.04 setup and run guide for SERL simulation.

This repository includes:
- a ready conda environment file (`env/serl_env.yml`)
- SERL as a git submodule (`serl/`)
- helper scripts (`scripts/`)

## 0. Fresh Ubuntu 22.04 prerequisites

Install required system tools:

```bash
sudo apt update
sudo apt install -y git build-essential curl wget
```

## 1. Install Miniconda (only if Conda is not already installed)

If `conda` is already available on your system, that is enough. You do not need Miniconda.

```bash
cd ~
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
```

After installation, open a new terminal. Then run:

```bash
conda --version
```

If `conda: command not found`, initialize shell manually:

```bash
source ~/miniconda3/etc/profile.d/conda.sh
echo 'source ~/miniconda3/etc/profile.d/conda.sh' >> ~/.bashrc
source ~/.bashrc
```

## 2. Create a workspace and clone the repository (with submodules)

Create a clean workspace folder, enter it, then clone:

```bash
mkdir -p ~/serl_ws
cd ~/serl_ws
git clone --recurse-submodules https://github.com/NIRMALRAJA2206/SERL_try.git
cd SERL_try
```

What this does:
- `mkdir -p ~/serl_ws`: creates a reusable workspace folder
- `cd ~/serl_ws`: ensures the repo is cloned inside that workspace
- `--recurse-submodules`: also fetches the `serl/` submodule in one step

Verify submodule checkout:

```bash
git submodule status
```

If you already cloned without submodules, run:

```bash
git submodule update --init --recursive
```

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
cd serl
pip install -e ./serl_launcher
pip install -r ./serl_launcher/requirements.txt
pip install -e ./franka_sim
pip install -r ./franka_sim/requirements.txt
cd ..
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

- `conda: command not found`:
  ```bash
  source ~/miniconda3/etc/profile.d/conda.sh
  conda --version
  ```
- `./serl/serl_launcher is not a valid editable requirement`:
  You are either in the wrong directory or submodule is missing.
  ```bash
  cd ~/serl_ws/SERL_try
  git submodule update --init --recursive
  ls -la serl
  cd serl
  pip install -e ./serl_launcher
  ```
- `ModuleNotFoundError: serl_launcher`:
  ```bash
  cd ~/serl_ws/SERL_try/serl
  pip install -e ./serl_launcher
  ```
- `ModuleNotFoundError: franka_sim`:
  ```bash
  cd ~/serl_ws/SERL_try/serl
  pip install -e ./franka_sim
  ```
