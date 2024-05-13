# This reconstructs any marginalized parameters
OMP_NUM_THREADS=1
pycbc_inference_model_stats \
--input-file output.hdf \
--output-file demarg_inj.hdf \
--nprocesses 1 \
--reconstruct-parameters \
--force \
--verbose

pycbc_inference_plot_posterior --verbose\
    --input-file demarg_inj.hdf \
    --output-file demarg_inj_1.png \
    --parameters \
        'primary_mass(mass1, mass2):mass1' \
        'secondary_mass(mass1, mass2):mass2' \
        'primary_mass(mass1, mass2)/secondary_mass(mass1, mass2):q' \
        '(mass1+mass2)*secondary_mass(mass1, mass2)/primary_mass(mass1, mass2):M' \
    --z-arg snr --plot-injection-parameters

pycbc_inference_plot_posterior --verbose\
    --input-file demarg_inj.hdf \
    --output-file demarg_inj.png \
    --parameters \
        'primary_mass(mass1, mass2):mass1' \
        'secondary_mass(mass1, mass2):mass2' \
        'primary_mass(mass1, mass2)/secondary_mass(mass1, mass2):q' \
        '(mass1+mass2)*secondary_mass(mass1, mass2)/primary_mass(mass1, mass2):M' \
        ra dec tc inclination coa_phase polarization distance \
    --z-arg snr --plot-injection-parameters



    
