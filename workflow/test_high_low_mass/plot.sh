pycbc_inference_plot_posterior --verbose\
    --input-file /home/lroy02/ground_based_acc/project/workflow/test/workflow_outputs/local-site-scratch/work/H1L1V1-DEMARGINALIZATION_DEMARG_INFERENCE-GW170729_185629-0-10.hdf \
    --output-file H1L1V1-DEMARGINALIZATION_DEMARG_INFERENCE-GW170729_185629-0-10.png \
    --parameters \
        'mass1_from_mchirp_q(mchirp, q):mass1' \
        'mass2_from_mchirp_q(mchirp, q):mass2' \
        mchirp q \
        acc \
    --z-arg snr


