#!/bin/bash
#PBS -N CogD
#PBS -P ee
#PBS -l select=1:ncpus=1:ngpus=1
#PBS -l walltime=12:00:00

## SPECIFY JOB NOW
JOBNAME=CogKeras
CURTIME=$(date +%Y%m%d%H%M%S)

LOGNUM=LF_IPA_IELEX_SYM_CFeat
CODEDIR=/home/ee/btech/ee1130798/BTP/Code/SiameseConvNet
PYTHON=/home/ee/btech/ee1130798/anaconda/bin/python
cd $CODEDIR

THEANO_FLAGS='lib.cnmem=0.5' $PYTHON $CODEDIR/CoAtt.py data/IPA_IELEX_DF1.pkl -conceptfeat True -lstm 75 -embd 30 -l2 0.02 -epochs 50 > $CODEDIR/RerunLogs/log$LOGNUM.txt 2> $CODEDIR/RerunLogs/err$LOGNUM.txt

