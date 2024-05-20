pycbc_inference_plot_posterior --verbose\
    --input-file demarg_without_a.hdf \
    --output-file A1_GW150914.png \
    --parameters \
        'primary_mass(mass1, mass2):mass1' \
        'secondary_mass(mass1, mass2):mass2' \
        'mchirp_from_mass1_mass2(mass1, mass2):mchirp' \
        'primary_mass(mass1, mass2)/secondary_mass(mass1, mass2):q'\
    --z-arg snr
