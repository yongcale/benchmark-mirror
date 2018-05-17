#!/bin/bash
# 
# conda install latest tensorflow and horovod on AWS DLAMI
#
# usage: sh setup_tf_hvd.sh 

# install tensorflow
sudo pip install --ignore-installed --upgrade tensorflow_gpu 
sudo pip3 install --ignore-installed --upgrade tensorflow_gpu

# install horovod
sudo pip install --no-cache-dir horovod
sudo pip3 install --no-cache-dir horovod
