pycbc_inference_plot_posterior --verbose\
    --input-file /home/lroy02/ground_based_acc/separate_runs/GW190425/demarg_GW190425_zero_a.hdf \
    --output-file separate_zero_a_GW190425_masses.png \
    --parameters \
        'mass1_from_mchirp_q(mchirp, q):mass1' \
        'mass2_from_mchirp_q(mchirp, q):mass2' \
        mchirp q \
        lambda2 lambda1 \
    --z-arg snr


pycbc_inference_plot_posterior --verbose\
    --input-file /home/lroy02/ground_based_acc/separate_runs/GW190425/demarg_GW190425_zero_a.hdf \
    --output-file separate_zero_a_GW190425_spins.png \
    --parameters \
        spin1_a spin2_a spin1_azimuthal spin2_azimuthal spin1_polar spin2_polar \
        'chi_eff_from_spherical(mass1_from_mchirp_q(mchirp, q), mass2_from_mchirp_q(mchirp, q), spin1_a, spin1_polar, spin2_a, spin2_polar):chi_eff' \
        'chi_p_from_spherical(mass1_from_mchirp_q(mchirp, q), mass2_from_mchirp_q(mchirp, q), spin1_a, spin1_azimuthal, spin1_polar, spin2_a, spin2_azimuthal, spin2_polar):chi_p' \
    --z-arg snr


pycbc_inference_plot_posterior --verbose\
    --input-file /home/lroy02/ground_based_acc/separate_runs/GW190425/demarg_GW190425_zero_a.hdf \
    --output-file separate_zero_a_GW190425_extrinsic.png \
    --parameters \
        ra dec \
        inclination distance polarization coa_phase \
    --z-arg snr
