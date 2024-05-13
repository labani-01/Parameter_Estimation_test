pycbc_inference_plot_posterior --verbose\
    --input-file demarg_inj.hdf \
    --output-file demarg_inj.png \
    --parameters \
        'primary_mass(mass1, mass2):mass1' \
        'secondary_mass(mass1, mass2):mass2' \
        'primary_mass(mass1, mass2)/secondary_mass(mass1, mass2):q' \
        '(mass1+mass2):M' \
        ra dec tc inclination coa_phase polarization distance \
    --z-arg snr --plot-injection-parameters
