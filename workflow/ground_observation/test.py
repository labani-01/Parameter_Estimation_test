	#!/bin/bash

import h5py
import re
import pycbc.workflow as wf
import pycbc
import argparse, os
import configparser
import numpy as np
from pycbc.workflow.configuration import WorkflowConfigParser
import pycbc.workflow.pegasus_workflow as wdax
import pathlib
import pycbc.conversions
import pycbc.cosmology 
from pycbc.waveform import get_td_waveform, get_fd_waveform


parser = argparse.ArgumentParser()
parser.add_argument("--data", nargs='*')
parser.add_argument("--prior-catalog", nargs='*') 
parser.add_argument("--posterior-files", nargs='*')
parser.add_argument("--inference-config")
#in the .sh file inference-config is OK. But in the python script write it as inference_config.

pycbc.init_logging(True)
wf.add_workflow_command_line_group(parser)
wf.add_workflow_settings_cli(parser)
opts = parser.parse_args()

#print(opts)

workflow = wf.Workflow(opts, "ground_based_observations")
wf.makedir(opts.output_dir)

infhand = wf.resolve_url_to_file(opts.inference_config)
 
inference_exe = wf.Executable(workflow.cp, "inference", ifos=workflow.ifos,
                              out_dir=opts.output_dir)

demarg_exe = wf.Executable(workflow.cp, "demarginalization", ifos=workflow.ifos,
                              out_dir=opts.output_dir)

#plot_exe = wf.Executable(workflow.cp, "plot", ifos=workflow.ifos,
#                              out_dir=opts.output_dir)

config = configparser.ConfigParser()

for i, (priors, post_files, data_files) in enumerate(zip(opts.prior_catalog, opts.posterior_files, opts.data)):
    config.read(priors)
    static_section = "static_params"
    #spin1_a = "prior-spin1_a"
    post = h5py.File(post_files,'r')
    data_section = "data"

    index = int(np.argmax(post['samples']['loglikelihood']))
    s1_r = float(post['samples']['spin1_a'][index])
    s2_r = float(post['samples']['spin2_a'][index])
    s1_p = float(post['samples']['spin1_polar'][index])
    s2_p = float(post['samples']['spin2_polar'][index])
    s1_a = float(post['samples']['spin1_azimuthal'][index])
    s2_a = float(post['samples']['spin2_azimuthal'][index])
    #inclination = float(post['samples']['inclination'][index])
    tc_value = float(config.get(static_section, "trigger_time"))
    #ra = float(pycbc.conversions.optimal_ra_from_detector('H1', tc_value))
    #dec = float(pycbc.conversions.optimal_dec_from_detector('H1', tc_value))
    #coa_phase = float(post['samples']['coa_phase'][index])
    #polarization = float(post['samples']['polarization'][index])
    distance = float(post['samples']['distance'][index])
    base = config.get(static_section, "approximant")
    #if base == "IMRPhenomD_NRTidal":
        #lambda1 = float(post['samples']['lambda1'][index])
        #lambda2 = float(post['samples']['lambda2'][index])
    min_mchirp = int(np.min(post['samples']['srcmchirp'][:] * (1+post['samples']['redshift'][:])))
    max_mchirp = int(np.max(post['samples']['srcmchirp'][:] * (1+post['samples']['redshift'][:])))
    min_q = int(np.min(post['samples']['q']))
    max_q = int(np.max(post['samples']['q']))
    min_m1 = pycbc.conversions.mass1_from_mchirp_q(int(float(min_mchirp)), min_q)
    min_m2 = pycbc.conversions.mass2_from_mchirp_q(int(float(min_mchirp)), min_q)
    max_dis = int(np.max(post['samples']['distance'][:]))
    min_dis = int(np.min(post['samples']['distance'][:]))
    hp, _ = get_td_waveform(approximant="constlosAcc", mass1=min_m1, mass2=min_m2, f_lower=20, delta_t=1.0/2048, v0=0, acc=0, base_model=base, n=0.1)
    #t = int(hp.duration) 
    detect = config.get(data_section, "instruments")
    #channel = config.get(data_section, "channel-name")
    start = int(hp.start_time)
    end = int(hp.end_time)
    path = os.path.join(opts.output_dir, f'prior_{pathlib.Path(priors).stem}.ini')
    with open(path, 'w') as f:
        f.write(f"""
[static_params]
base_model = {base}
trigger_time = {tc_value}

[prior-mchirp]
name = mchirp_from_uniform_mass1_mass2
min-mchirp = {min_mchirp}
max-mchirp = {max_mchirp + 1}

[prior-q]
name = q_from_uniform_mass1_mass2
min-q = {min_q}
max-q = {max_q}

[prior-distance]
#; following gives a uniform in volume
name = uniform_radius
min-distance = {min_dis}
max-distance = {max_dis}

[prior-tc]
#; coalescence time prior
name = uniform
min-tc = {tc_value - 0.1}
max-tc = {tc_value + 0.1}

[data]
instruments = {detect}
trigger-time = {tc_value}
analysis-start-time = {start - 20}
analysis-end-time = {end + 10}
""")
        #file_paths = []
        #f.write("frame-files = ")
        detectors = ['H1', 'L1', 'V1']
        file_paths = {det: None for det in detectors}
        strain_versions = {}
        for root, _, files in os.walk(data_files): 
        #for root, _, files in os.walk(data_files):
            for file in files:
                if "H-H1" in file:
                    file_paths["H1"] = os.path.join(root, file)
                    strain_versions["H1"] = "R1" if "R1" in file else "R2"
                elif "L-L1" in file:
                    file_paths["L1"] = os.path.join(root, file)
                    strain_versions["L1"] = "R1" if "R1" in file else "R2"
                elif "V-V1" in file:
                    file_paths["V1"] = os.path.join(root, file)
                    strain_versions["V1"] = "R1" if "R1" in file else "R2"
            #for file, detector in zip(files, detectors):
                #file_path = os.path.join(root, file)
                #f.write(f"{detector}:{file_path} ")
        channel_str = " ".join([f"{det}:GWOSC-4KHZ_{strain_versions[det]}_STRAIN" for det in detectors if file_paths[det]])
        f.write(f"channel-name = {channel_str}\n")

        f.write("frame-files = ")
        for detector in detectors:
            if file_paths[detector]:
                f.write(f"{detector}:{file_paths[detector]} ")
    fhand = wf.resolve_url_to_file(path)
    node = inference_exe.create_node()
    node.add_input_list_opt("--config-file", [infhand, fhand])
    inference_file = node.new_output_file_opt(workflow.analysis_time, '.hdf', '--output-file', tags=[os.path.splitext(os.path.basename(priors))[0]])
    workflow += node
    node = demarg_exe.create_node()
    node.add_input_opt("--input-file", inference_file)
    demarg_file = node.new_output_file_opt(workflow.analysis_time, '.hdf', '--output-file', tags=["demarg_" + os.path.splitext(os.path.basename(priors))[0]])
    workflow += node
#    node = plot_exe.create_node()
#    node.add_input_opt("--input-file", demarg_file)
#    plot_file = node.new_output_file_opt(workflow.analysis_time, '.png', '--output-file', tags=[os.path.splitext(os.path.basename(priors))[0]])
#    workflow += node
    #       node = plot_exe.create_node()
#       node.add_input_opt("--input-file", inference_file)
#       plot_file = node.new_output_file_opt(workflow.analysis_time, ".png",
#                                             "--output-file",
#                                            tags=[str(inj)])
#       workflow += node
    
workflow.save()
