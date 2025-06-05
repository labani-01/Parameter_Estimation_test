#!/bin/bash

python main_python.py --data /home/lroy02/acceleration_project/workflow/nonzero_acc_inference/data_GW190408_to_GW200316/* --workflow-name all_ground_based_obs_nliv \
 --prior-catalog /home/lroy02/gwastro_4_ogc/4-ogc/inference_configuration/* \
 --posterior-files /home/lroy02/gwastro_4_ogc/4-ogc/posterior/* \
 --config-files /home/lroy02/PE/workflow/ground_observation_nliv/workflow.ini \
 --inference-config /home/lroy02/PE/workflow/ground_observation_nliv/common_config.ini \
 --output-dir /home/lroy02/ground_based_acc/project/workflow/main_workflow/workflow_outputs_nliv --submit-now
