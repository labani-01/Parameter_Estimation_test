pycbc_create_injections --verbose \
        --config-files inj_new.ini \
        --ninjections 1 \
        --seed 10 \
        --output-file inj_new.hdf \
        --variable-params-section variable_params \
        --static-params-section static_params \
        --dist-section prior \
        --force
