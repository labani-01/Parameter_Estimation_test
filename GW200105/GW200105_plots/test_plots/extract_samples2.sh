pycbc_inference_extract_samples --verbose\
    --input-file /home/lroy02/PE/GW200105/GW200105_plots/test_plots/extract_4_ogc_inference.hdf \
    --output-file extract_4_ogc_inference2.hdf \
    --parameters \
        redshift \
        distance ra dec inclination coa_phase \
        srcmchirp \
        q \
        spin1_a spin1_polar spin2_a spin2_polar spin1_azimuthal spin2_azimuthal \
        ra dec \
        inclination polarization coa_phase \
        'srcmass1 * (1 + redshift):mass1' \
        'srcmass2 * (1 + redshift):mass2' \
        'srcmchirp * (1 + redshift):mchirp' \
        loglikelihood \
        delta_tc \
        logwt \
        lambda2 \
