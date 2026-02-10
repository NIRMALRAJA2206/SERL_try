#!/usr/bin/env bash
set -euo pipefail

# Runs manual control (no learner/actor).

export JAX_PLATFORMS=cpu
export PYTHONNOUSERSITE=1

cd /home/karuppia/serl_ws/serl_sim_ws/src/serl/examples/async_sac_state_sim
python manual_control.py
