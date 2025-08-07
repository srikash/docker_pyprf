#!/bin/bash
# Source the conda setup script to get 'conda' command
source /opt/conda/etc/profile.d/conda.sh
# Activate your environment
conda activate pyprf
# Run whatever command was passed (or bash by default)
exec "$@"
