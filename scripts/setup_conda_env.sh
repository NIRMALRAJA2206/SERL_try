#!/usr/bin/env bash
set -euo pipefail

# Creates the serl conda environment using the provided env file.
# Assumes conda is installed and initialized in your shell.

conda env create -n serl -f "$(dirname "$0")/../env/serl_env.yml"
