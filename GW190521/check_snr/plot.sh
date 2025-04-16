pycbc_inference_plot_posterior --verbose\
    --input-file /home/lroy02/acceleration_project/GW190521/inference_nonzero_acc_spins_tc_sky_inc_pol_coa_acc_dis.hdf \
    --output-file GW190521_nonzero_acc_spins_tc_sky_inc_pol_coa_acc_dis.png \
    --parameters \
        'mass1_from_mchirp_q(mchirp, q):mass1' \
        'mass2_from_mchirp_q(mchirp, q):mass2' \
        mchirp q \
    --z-arg snr
