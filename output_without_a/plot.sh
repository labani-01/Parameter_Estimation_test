pycbc_inference_plot_posterior --verbose\
    --input-file demarg_without_a.hdf \
    --output-file demarg_without_a_intrinsic.png \
    --parameters \
        'mass1_from_mchirp_q(srcmchirp,q) * (1 + redshift_from_comoving_volume(comoving_volume)):mass1' \
        'mass2_from_mchirp_q(srcmchirp,q) * (1 + redshift_from_comoving_volume(comoving_volume)):mass2' \
        q \
        'mass1_from_mchirp_q(srcmchirp,q) * (1 + redshift_from_comoving_volume(comoving_volume)) + mass2_from_mchirp_q(srcmchirp,q) * (1 + redshift_from_comoving_volume(comoving_volume)):M' \
    --z-arg snr

pycbc_inference_plot_posterior --verbose\
    --input-file demarg_without_a.hdf \
    --output-file demarg_without_a_extrinsic.png \
    --parameters \
        'mass1_from_mchirp_q(srcmchirp,q) * (1 + redshift_from_comoving_volume(comoving_volume)):mass1' \
        'mass2_from_mchirp_q(srcmchirp,q) * (1 + redshift_from_comoving_volume(comoving_volume)):mass2' \
        'mass1_from_mchirp_q(srcmchirp,q) * (1 + redshift_from_comoving_volume(comoving_volume)) + mass2_from_mchirp_q(srcmchirp,q) * (1 + redshift_from_comoving_volume(comoving_volume)):M' \
        q ra dec tc inclination coa_phase polarization distance \
    --z-arg snr 
