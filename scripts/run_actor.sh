#!/usr/bin/env bash
set -euo pipefail

# Runs the async SAC actor.

export JAX_PLATFORMS=cpu
export PYTHONNOUSERSITE=1

cd /home/karuppia/serl_ws/serl_sim_ws/src/serl/examples/async_sac_state_sim
python async_sac_state_sim.py --actor --env PandaPickCube-v0 --render --debug
