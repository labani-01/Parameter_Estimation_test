pycbc_inference_plot_posterior --verbose\
    --input-file /home/lroy02/ground_based_acc/project/workflow/test/workflow_outputs1/H1L1V1-DEMARGINALIZATION_DEMARG_INFERENCE-GW190521_030229-0-10.hdf \
    --output-file A1_nonzero_a_GW170104_masses.png \
    --parameters \
        'mass1_from_mchirp_q(mchirp, q):mass1' \
        'mass2_from_mchirp_q(mchirp, q):mass2' \
        mchirp q \
    --z-arg snr


