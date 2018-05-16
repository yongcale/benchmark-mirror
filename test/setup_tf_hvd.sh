#!/bin/bash
# 
# conda install latest tensorflow and horovod on AWS DLAMI
#
# usage: sh setup_tf_hvd.sh 

# install tensorflow
sudo pip install --ignore-installed --upgrade tensorflow_gpu 
sudo pip3 install --ignore-installed --upgrade tensorflow_gpu

# install horovod
pip install --no-cache-dir horovod
pip3 install --no-cache-dir horovod
