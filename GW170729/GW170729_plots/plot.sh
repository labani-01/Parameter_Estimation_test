pycbc_inference_plot_posterior --verbose\
    --input-file /home/lroy02/ground_based_acc/project/workflow/test/workflow_outputs/local-site-scratch/work/H1L1V1-DEMARGINALIZATION_DEMARG_INFERENCE-GW170729_185629-0-10.hdf \
    --output-file H1L1V1-PLOT_INFERENCE-GW170729_185629-0-10_masses.png \
    --parameters \
        'mass1_from_mchirp_q(mchirp, q):mass1' \
        'mass2_from_mchirp_q(mchirp, q):mass2' \
        mchirp q \
        acc \
    --z-arg snr


pycbc_inference_plot_posterior --verbose\
    --input-file /home/lroy02/ground_based_acc/project/workflow/test/workflow_outputs/local-site-scratch/work/H1L1V1-DEMARGINALIZATION_DEMARG_INFERENCE-GW170729_185629-0-10.hdf \
    --output-file H1L1V1-PLOT_INFERENCE-GW170729_185629-0-10_spins.png \
    --parameters \
        spin1_a spin2_a spin1_azimuthal spin2_azimuthal spin1_polar spin2_polar \
        'chi_eff_from_spherical(mass1_from_mchirp_q(mchirp, q), mass2_from_mchirp_q(mchirp, q), spin1_a, spin1_polar, spin2_a, spin2_polar):chi_eff' \
        'chi_p_from_spherical(mass1_from_mchirp_q(mchirp, q), mass2_from_mchirp_q(mchirp, q), spin1_a, spin1_azimuthal, spin1_polar, spin2_a, spin2_azimuthal, spin2_polar):chi_p' \
    --z-arg snr


pycbc_inference_plot_posterior --verbose\
    --input-file /home/lroy02/ground_based_acc/project/workflow/test/workflow_outputs/local-site-scratch/work/H1L1V1-DEMARGINALIZATION_DEMARG_INFERENCE-GW170729_185629-0-10.hdf \
    --output-file H1L1V1-PLOT_INFERENCE-GW170729_185629-0-10_extrinsic.png \
    --parameters \
        ra dec \
        inclination distance polarization coa_phase \
    --z-arg snr
