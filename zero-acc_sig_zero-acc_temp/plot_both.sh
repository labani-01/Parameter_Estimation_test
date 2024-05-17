pycbc_inference_extract_samples --verbose \
    --input-file demarg_without_a.hdf \
    --output-file GW150914.hdf \
    --parameters \
        'primary_mass(mass1, mass2):mass1' \
        'secondary_mass(mass1, mass2):mass2' \
        'primary_mass(mass1, mass2)/secondary_mass(mass1, mass2):q' \
        '(mass1+mass2):M' \
        ra dec tc inclination coa_phase polarization distance \
    --skip-groups data sampler_info


pycbc_inference_extract_samples --verbose \
    --input-file demarg_inj.hdf \
    --output-file injection.hdf \
    --parameters \
        'primary_mass(mass1, mass2):mass1' \
        'secondary_mass(mass1, mass2):mass2' \
        'primary_mass(mass1, mass2)/secondary_mass(mass1, mass2):q' \
        '(mass1+mass2):M' \
        ra dec tc inclination coa_phase polarization distance \
    --skip-groups data sampler_info
