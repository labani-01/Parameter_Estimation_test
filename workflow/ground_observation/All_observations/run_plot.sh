#!/bin/bash

# Base directory where .hdf files are located
BASE_DIR="/home/lroy02/ground_based_acc/project/workflow/main_workflow/workflow_outputs/local-site-scratch/work"

# Input .hdf file from arguments
INPUT_FILE=$1

# Full path to the .hdf file
FULL_PATH="${BASE_DIR}/${INPUT_FILE}"

# Extract base name (remove .hdf extension)
BASENAME=$(basename "$INPUT_FILE" .hdf)

# Extract short name (e.g., GW151012_095443-0-10 from full filename)
SHORT_NAME=$(echo "$BASENAME" | grep -o 'GW[0-9_]*-[0-9]*')

# Create subfolder for outputs
SUBFOLDER="./${SHORT_NAME}"
mkdir -p "$SUBFOLDER"

# Log (optional)
echo "Input: $INPUT_FILE"
echo "Subfolder: $SUBFOLDER"
echo "Writing: ${SHORT_NAME}_masses.png"
echo "Writing: ${SHORT_NAME}_spins.png"
echo "Writing: ${SHORT_NAME}_extrinsic.png"

# Generate mass plot
pycbc_inference_plot_posterior --verbose \
    --input-file "$FULL_PATH" \
    --output-file "${SUBFOLDER}/${SHORT_NAME}_masses.png" \
    --parameters \
        'mass1_from_mchirp_q(mchirp, q):mass1' \
        'mass2_from_mchirp_q(mchirp, q):mass2' \
        mchirp q acc \
    --z-arg snr

# Generate spin plot
pycbc_inference_plot_posterior --verbose \
    --input-file "$FULL_PATH" \
    --output-file "${SUBFOLDER}/${SHORT_NAME}_spins.png" \
    --parameters \
        spin1_a spin2_a spin1_azimuthal spin2_azimuthal spin1_polar spin2_polar \
        'chi_eff_from_spherical(mass1_from_mchirp_q(mchirp, q), mass2_from_mchirp_q(mchirp, q), spin1_a, spin1_polar, spin2_a, spin2_polar):chi_eff' \
        'chi_p_from_spherical(mass1_from_mchirp_q(mchirp, q), mass2_from_mchirp_q(mchirp, q), spin1_a, spin1_azimuthal, spin1_polar, spin2_a, spin2_azimuthal, spin2_polar):chi_p' \
    --z-arg snr

# Generate extrinsic plot
pycbc_inference_plot_posterior --verbose \
    --input-file "$FULL_PATH" \
    --output-file "${SUBFOLDER}/${SHORT_NAME}_extrinsic.png" \
    --parameters \
        ra dec inclination distance \ 
        polarization coa_phase \
    --z-arg snr
