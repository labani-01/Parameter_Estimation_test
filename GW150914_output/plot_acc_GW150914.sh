pycbc_inference_plot_posterior --verbose\
    --input-file demarg_with_acc.hdf \
    --output-file A1_acc_GW150914_masses.png \
    --parameters \
        'primary_mass(mass1, mass2):mass1' \
        'secondary_mass(mass1, mass2):mass2' \
        'mchirp_from_mass1_mass2(mass1, mass2):mchirp' \
        'primary_mass(mass1, mass2)/secondary_mass(mass1, mass2):q' \
        acc \
    --z-arg snr


pycbc_inference_plot_posterior --verbose\
    --input-file demarg_with_acc.hdf \
    --output-file A2_acc_GW150914_spins.png \
    --parameters \
        spin1_a spin2_a spin1_azimuthal spin2_azimuthal spin1_polar spin2_polar \
        'chi_eff_from_spherical(mass1, mass2, spin1_a, spin1_polar, spin2_a, spin2_polar):chi_eff' \
        'chi_p_from_spherical(mass1, mass2, spin1_a, spin1_azimuthal, spin1_polar, spin2_a, spin2_azimuthal, spin2_polar):chi_p' \
    --z-arg snr


pycbc_inference_plot_posterior --verbose\
    --input-file demarg_with_acc.hdf \
    --output-file A3_acc_GW150914_extrinsic.png \
    --parameters \
        ra dec \
        inclination distance \
    --z-arg snr
