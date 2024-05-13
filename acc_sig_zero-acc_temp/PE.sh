#!/bin/bash
  
export OMP_NUM_THREADS=1

/home/lroy02/miniconda3/envs/gravity/bin/pycbc_inference \
        --config-file "$1"  \
        --nprocesses 1 \
        --processing-scheme cpu \
        --output-file "$2"\
        --seed 0 \
        --force \
        --verbose
