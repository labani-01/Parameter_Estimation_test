pycbc_inference_plot_posterior --verbose\
    --input-file /home/lroy02/acceleration_project/GW190521/demarg_nonzero_acc_new_env.hdf \
    --output-file test_GW190521_masses.png \
    --parameters \
        'mass1_from_mchirp_q(mchirp, q):mass1' \
        'mass2_from_mchirp_q(mchirp, q):mass2' \
        mchirp q \
    --z-arg snr


