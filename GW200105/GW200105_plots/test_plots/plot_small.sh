pycbc_inference_plot_posterior --verbose\
    --input-file /home/lroy02/ground_based_acc/separate_runs/GW200105/test_runs/4_ogc_cal_lambda_frame_modelsetting1_const_inference7.hdf \
    --output-file masses_4_ogc_cal_lambda_frame_modelsetting1_const_inference7.png \
    --parameters \
        'mass1_from_mchirp_q(mchirp, q):mass1' \
        'mass2_from_mchirp_q(mchirp, q):mass2' \
        mchirp q \
    --z-arg snr
