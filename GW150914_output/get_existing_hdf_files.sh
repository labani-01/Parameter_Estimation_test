pycbc_inference_extract_samples --verbose\
    --input-file GW150914_095045-PYCBC-POSTERIOR-IMRPhenomXPHM.hdf \
    --output-file GW150914_095045-PYCBC-POSTERIOR-IMRPhenomXPHM_updated.hdf \
    --parameters \
        'primary_mass(srcmass1*(1+redshift), srcmass2*(1+redshift)):mass1' \
        'secondary_mass(srcmass1*(1+redshift), srcmass2*(1+redshift)):mass2' \
        'mchirp_from_mass1_mass2(primary_mass(srcmass1*(1+redshift), srcmass2*(1+redshift)), secondary_mass(srcmass1*(1+redshift), srcmass2*(1+redshift))):mchirp' \
        'primary_mass(srcmass1*(1+redshift), srcmass2*(1+redshift))/secondary_mass(srcmass1*(1+redshift), srcmass2*(1+redshift)):q' \
        spin1_a spin2_a spin1_azimuthal spin2_azimuthal spin1_polar spin2_polar chi_eff chi_p \
        ra dec \
        inclination distance \
   --skip-groups config_file data sampler_info 




