pycbc_inference_extract_samples --verbose\
    --input-file demarg_without_a.hdf \
    --output-file GW150914_without_a_samples.hdf \
    --parameters \
        'primary_mass(mass1, mass2):mass1' \
        'secondary_mass(mass1, mass2):mass2' \
        'mchirp_from_mass1_mass2(mass1, mass2):mchirp' \
        'primary_mass(mass1, mass2)/secondary_mass(mass1, mass2):q' \
        spin1_a spin2_a spin1_azimuthal spin2_azimuthal spin1_polar spin2_polar \
        'chi_eff_from_spherical(mass1, mass2, spin1_a, spin1_polar, spin2_a, spin2_polar):chi_eff' \
        'chi_p_from_spherical(mass1, mass2, spin1_a, spin1_azimuthal, spin1_polar, spin2_a, spin2_azimuthal, spin2_polar):chi_p' \
        ra dec \
        inclination distance \
   --skip-groups config_file data sampler_info 



