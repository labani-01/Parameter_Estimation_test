pycbc_inference_plot_posterior --verbose\
    --input-file /home/lroy02/acceleration_project/output_without_a/demarg_nonzero_large_acc.hdf \
    --output-file A1_nonzero_large_a_GW150914_masses1.png \
    --parameters \
        'mass1_from_mchirp_q(mchirp, q):mass1' \
        'mass2_from_mchirp_q(mchirp, q):mass2' \
        mchirp q acc \
    --z-arg snr


pycbc_inference_plot_posterior --verbose\
    --input-file /home/lroy02/acceleration_project/output_without_a/demarg_nonzero_large_acc.hdf \
    --output-file A2_nonzero_large_a_GW150914_spins1.png \
    --parameters \
        spin1_a spin2_a spin1_azimuthal spin2_azimuthal spin1_polar spin2_polar \
        'chi_eff_from_spherical(mass1_from_mchirp_q(mchirp, q), mass2_from_mchirp_q(mchirp, q), spin1_a, spin1_polar, spin2_a, spin2_polar):chi_eff' \
        'chi_p_from_spherical(mass1_from_mchirp_q(mchirp, q), mass2_from_mchirp_q(mchirp, q), spin1_a, spin1_azimuthal, spin1_polar, spin2_a, spin2_azimuthal, spin2_polar):chi_p' \
    --z-arg snr


pycbc_inference_plot_posterior --verbose\
    --input-file /home/lroy02/acceleration_project/output_without_a/demarg_nonzero_large_acc.hdf \
    --output-file A3_nonzero_large_a_GW150914_extrinsic1.png \
    --parameters \
        ra dec \
        inclination distance polarization coa_phase \
    --z-arg snr