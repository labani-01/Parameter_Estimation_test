pycbc_inference_plot_posterior --verbose\
    --input-file /home/lroy02/ground_based_acc/separate_runs/GW151226/demarg_nonzero_a_GW151226_new_model.hdf \
    --output-file separate_nonzero_a_GW151226_masses_new_model.png \
    --parameters \
        'mass1_from_mchirp_q(mchirp, q):mass1' \
        'mass2_from_mchirp_q(mchirp, q):mass2' \
        mchirp q \
        acc \
    --z-arg snr


pycbc_inference_plot_posterior --verbose\
    --input-file /home/lroy02/ground_based_acc/separate_runs/GW151226/demarg_nonzero_a_GW151226_new_model.hdf \
    --output-file separate_nonzero_a_GW151226_spins_new_model.png \
    --parameters \
        spin1_a spin2_a spin1_azimuthal spin2_azimuthal spin1_polar spin2_polar \
        'chi_eff_from_spherical(mass1_from_mchirp_q(mchirp, q), mass2_from_mchirp_q(mchirp, q), spin1_a, spin1_polar, spin2_a, spin2_polar):chi_eff' \
        'chi_p_from_spherical(mass1_from_mchirp_q(mchirp, q), mass2_from_mchirp_q(mchirp, q), spin1_a, spin1_azimuthal, spin1_polar, spin2_a, spin2_azimuthal, spin2_polar):chi_p' \
    --z-arg snr


pycbc_inference_plot_posterior --verbose\
    --input-file /home/lroy02/ground_based_acc/separate_runs/GW151226/demarg_nonzero_a_GW151226_new_model.hdf \
    --output-file separate_nonzero_a_GW151226_extrinsic_new_model.png \
    --parameters \
        ra dec \
        inclination distance polarization coa_phase \
    --z-arg snr
