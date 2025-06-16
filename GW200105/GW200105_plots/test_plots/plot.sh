pycbc_inference_plot_posterior --verbose\
    --input-file /home/lroy02/PE/GW200105/GW200105_plots/test_plots/extract_4_ogc_inference2.hdf \
    --output-file masses_4_ogc_inference.png \
    --parameters \
        mass1 mass2 \
        mchirp \
        q lambda2 \
    --z-arg snr

pycbc_inference_plot_posterior --verbose\
    --input-file /home/lroy02/PE/GW200105/GW200105_plots/test_plots/extract_4_ogc_inference2.hdf \
    --output-file spins_4_ogc_inference.png \
    --parameters \
        spin1_a spin2_a spin1_azimuthal spin2_azimuthal spin1_polar spin2_polar \
        'chi_eff_from_spherical(mass1, mass2, spin1_a, spin1_polar, spin2_a, spin2_polar):chi_eff' \
        'chi_p_from_spherical(mass1, mass2, spin1_a, spin1_azimuthal, spin1_polar, spin2_a, spin2_azimuthal, spin2_polar):chi_p' \
    --z-arg snr

pycbc_inference_plot_posterior --verbose\
    --input-file /home/lroy02/PE/GW200105/GW200105_plots/test_plots/extract_4_ogc_inference2.hdf \
    --output-file extrinsic_4_ogc_inference.png \
    --parameters \
        ra dec \
        inclination polarization coa_phase \
        distance \
        redshift \
    --z-arg snr
