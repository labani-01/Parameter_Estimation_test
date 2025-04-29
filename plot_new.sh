pycbc_inference_plot_posterior --verbose\
    --input-file /home/lroy02/H1L1V1-INFERENCE_INFERENCE-GW151226_033853-0-10.hdf.checkpoint \
    --output-file tset.png \
    --parameters \
        'mass1_from_mchirp_q(mchirp, q):mass1' \
        'mass2_from_mchirp_q(mchirp, q):mass2' \
        mchirp q \
        acc \
    --z-arg snr
