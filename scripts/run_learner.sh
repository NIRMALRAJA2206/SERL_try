#!/usr/bin/env bash
set -euo pipefail

# Runs the async SAC learner.

export JAX_PLATFORMS=cpu
export PYTHONNOUSERSITE=1
export WANDB_MODE=disabled

cd /home/karuppia/serl_ws/serl_sim_ws/src/serl/examples/async_sac_state_sim
python async_sac_state_sim.py --learner --env PandaPickCube-v0 --debug
