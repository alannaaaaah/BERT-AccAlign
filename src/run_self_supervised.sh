#!/bin/bash

# List of DATA values
DATA_VALUES=("mtref" "wiki" "newsela" "arxiv" "msr" "edinburgh")

# Output directory for self-supervised.py logs
UN_OUTDIR="../out/self-supervised/"

# Model to use (e.g., "bert-base-cased")
MODEL="bert-base-cased"

# Layer to use as token embedding (e.g., 6)
LAYER=6

# Seed for reproducibility (e.g., 42)
SEED=42

export CUDA_VISIBLE_DEVICES=2

# Loop over DATA values
for DATA in "${DATA_VALUES[@]}"; do
    # Build the command to run self-supervised.py
    CMD="python self-supervised_alignment.py --data $DATA --sure_and_possible --model bert-base-uncased --centering --pair_encode --layer 6 --out $UN_OUTDIR --seed $SEED"

    # Print the command
    echo "Running: ${CMD}"

    # Run the command
    ${CMD}

    # Build the command to run self-supervised.py
    CMD="python self-supervised_alignment.py --data $DATA --model bert-base-uncased --centering --pair_encode --layer 6 --out $UN_OUTDIR --seed $SEED"

    # Print the command
    echo "Running: ${CMD}"

    # Run the command
    ${CMD}

    # Print a separator
    echo "-------------------------------------"
done
