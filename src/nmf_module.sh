#!/bin/bash

# set up the environment and then call runit with the args
# The GP module command line should JUST be this script + args

export ARBDIR=/expanse/projects/mesirovlab/genepattern/servers/nmf-gpu-2
export RUNDIR=/expanse/projects/mesirovlab/genepattern/servers/nmf-gpu-2
export INSTALLDIR=/expanse/projects/mesirovlab/genepattern/servers/nmf-gpu-2/install
export RUNDIR=$PWD

module purge
module load slurm/expanse/20.02.3
module load gpu/0.15.4
module load openmpi/4.0.4
module load cuda10.2/toolkit/10.2.89
export CUDA_PATH=${CUDA_HOME}
export SM_VERSIONS="70 70"
export DBG=1
unset DBG
export VERBOSE=3
unset VERBOSE
export SYNC_TRANSF=1
export FIXED_INIT=1
export CPU_RANDOM=1
export PATH=${ARBDIR}/install/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${ARBDIR}/install/lib

echo "${INSTALLDIR}/runit/runit --jobdir=${PWD} --gpuprogrampath=${INSTALLDIR}/bin/NMF_mGPU ${@}" >cmd.txt

${INSTALLDIR}/runit/runit --jobdir=${PWD} --gpuprogrampath=${INSTALLDIR}/bin/NMF_mGPU ${@} 


