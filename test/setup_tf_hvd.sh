#!/bin/bash
# 
# conda install tensorflow and horovod on AWS DLAMI
#
# usage: sh setup_tf_hvd.sh tfBinaryURL
#
# example: sh setup_tf_hvd.sh  \
#             https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-1.7.0-cp36-cp36m-linux_x86_64.whl


if [ "$#" -ne 1 ]; then
    echo "Invalid number of parameters"
fi

# install tensorflow
pip install --ignore-installed --upgrade "$1"

# install horovod
#source activate $1; 
pip install --no-cache-dir horovod
