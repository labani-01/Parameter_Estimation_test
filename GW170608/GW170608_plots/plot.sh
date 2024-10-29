pycbc_inference_plot_posterior --verbose\
    --input-file /home/lroy02/acceleration_project/GW170608/demarg_zero_a_GW170608.hdf \
    --output-file A1_zero_a_GW170608_masses.png \
    --parameters \
        'mass1_from_mchirp_q(mchirp, q):mass1' \
        'mass2_from_mchirp_q(mchirp, q):mass2' \
        mchirp q \
    --z-arg snr


pycbc_inference_plot_posterior --verbose\
    --input-file /home/lroy02/acceleration_project/GW170608/demarg_zero_a_GW170608.hdf \
    --output-file A2_zero_a_GW170608_spins.png \
    --parameters \
        spin1_a spin2_a spin1_azimuthal spin2_azimuthal spin1_polar spin2_polar \
        'chi_eff_from_spherical(mass1_from_mchirp_q(mchirp, q), mass2_from_mchirp_q(mchirp, q), spin1_a, spin1_polar, spin2_a, spin2_polar):chi_eff' \
        'chi_p_from_spherical(mass1_from_mchirp_q(mchirp, q), mass2_from_mchirp_q(mchirp, q), spin1_a, spin1_azimuthal, spin1_polar, spin2_a, spin2_azimuthal, spin2_polar):chi_p' \
    --z-arg snr


pycbc_inference_plot_posterior --verbose\
    --input-file /home/lroy02/acceleration_project/GW170608/demarg_zero_a_GW170608.hdf \
    --output-file A3_zero_a_GW170608_extrinsic.png \
    --parameters \
        ra dec \
        inclination distance polarization coa_phase \
    --z-arg snr
