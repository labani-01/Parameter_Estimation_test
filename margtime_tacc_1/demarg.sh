#This reconstructs any marginalized parameters
OMP_NUM_THREADS=1
pycbc_inference_model_stats \
--input-file output.hdf \
--output-file demarg_inj.hdf \
--nprocesses 1 \
--reconstruct-parameters \
--force \
--verbose

pycbc_inference_plot_posterior \
--input-file demarg_inj.hdf \
--output-file demarg_inj.png \
--parameters \
 mass1 mass2 ra dec tc inclination coa_phase polarization distance \
--z-arg snr --plot-injection-parameters
