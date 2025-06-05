#!/bin/bash

python test.py --data /home/lroy02/acceleration_project/workflow/nonzero_acc_inference/data_test/* --workflow-name all_test \
 --prior-catalog /home/lroy02/gwastro_4_ogc/4-ogc/inference_configuration/inference-GW200316_215756.ini \
 --posterior-files /home/lroy02/gwastro_4_ogc/4-ogc/posterior/GW200316_215756-PYCBC-POSTERIOR-IMRPhenomXPHM.hdf \
 --config-files /home/lroy02/PE/workflow/ground_observation/workflow_test.ini \
 --inference-config /home/lroy02/PE/workflow/ground_observation/common_config.ini \
 --output-dir /home/lroy02/ground_based_acc/project/workflow/main_workflow/workflow_test --submit-now
