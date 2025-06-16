pycbc_inference_extract_samples --verbose\
    --input-file /home/lroy02/ground_based_acc/separate_runs/GW200105/test_runs/4_ogc_inference.hdf \
    --output-file extract_4_ogc_inference.hdf \
    --parameters \
        'mass1_from_mchirp_q(srcmchirp, q):srcmass1' \
        'mass2_from_mchirp_q(srcmchirp,q):srcmass2' \
        srcmchirp \
        q \
        spin1_a spin1_polar spin2_a spin2_polar spin1_azimuthal spin2_azimuthal \
        ra dec \
        inclination polarization coa_phase \
        'distance_from_comoving_volume(comoving_volume):distance' \
        'redshift_from_comoving_volume(comoving_volume):redshift' \
        loglikelihood \
        delta_tc \
        logwt \
        lambda2 \
