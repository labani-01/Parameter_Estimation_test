pycbc_inference_plot_posterior --verbose\
    --input-file GW150914_095045-PYCBC-POSTERIOR-IMRPhenomXPHM.hdf \
    --output-file A1_existing_GW150914_masses.png \
    --parameters \
        'primary_mass(srcmass1/(1+redshift), srcmass2/(1+redshift)):mass1' \
        'secondary_mass(srcmass1/(1+redshift), srcmass2/(1+redshift)):mass2' \
        'mchirp_from_mass1_mass2(primary_mass(srcmass1/(1+redshift), srcmass2/(1+redshift)), secondary_mass(srcmass1/(1+redshift), srcmass2/(1+redshift))):mchirp' \
        'primary_mass(srcmass1/(1+redshift), srcmass2/(1+redshift))/secondary_mass(srcmass1/(1+redshift), srcmass2/(1+redshift)):q' \
    --z-arg snr


pycbc_inference_plot_posterior --verbose\
    --input-file GW150914_095045-PYCBC-POSTERIOR-IMRPhenomXPHM.hdf \
    --output-file A2_existing_GW150914_spins.png \
    --parameters \
        spin1_a spin2_a spin1_azimuthal spin2_azimuthal spin1_polar spin2_polar \
        chi_eff chi_p \        
    --z-arg snr


pycbc_inference_plot_posterior --verbose\
    --input-file GW150914_095045-PYCBC-POSTERIOR-IMRPhenomXPHM.hdf \
    --output-file A3_existing_GW150914_extrinsic.png \
    --parameters \
        ra dec \
        inclination distance \
    --z-arg snr
