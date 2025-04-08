pycbc_inference_plot_posterior --verbose\
    --input-file /home/lroy02/ground_based_acc/project/test_settings/inference_GW190521_IMR_gauss.hdf \
    --output-file inference_GW190521_IMR_gauss.png \
    --parameters \
        'mass1_from_mchirp_q(mchirp, q):mass1' \
        'mass2_from_mchirp_q(mchirp, q):mass2' \
        mchirp q \
    --z-arg snr


