# This reconstructs any marginalized parameters
OMP_NUM_THREADS=1
pycbc_inference_model_stats \
--input-file output.hdf \
--output-file demarg_inj.hdf \
--nprocesses 1 \
--reconstruct-parameters \
--force \
--verbose

