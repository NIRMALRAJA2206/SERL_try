#!/usr/bin/env bash
set -euo pipefail

# Installs runtime dependency used by manual control.
# Assumes the serl conda environment is active.

pip install pygame
