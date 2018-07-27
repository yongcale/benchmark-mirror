## download script
if [ -d benchmarks ]
then
    echo "repo benchmarks exists"
else
    git clone https://github.com/tensorflow/benchmarks.git -b cnn_tf_v1.8_compatible
    #wget https://raw.githubusercontent.com/tensorflow/benchmarks/mkl_experiment/scripts/tf_cnn_benchmarks/tf_cnn_benchmarks.py
    echo "Downloaded tf official benchmarking sripts"
fi
cd benchmarks/scripts/tf_cnn_benchmarks/

#Setup num_intra_threads and num_inter_threads
num_cores=4
num_inter_t=2

# Set MKL environment variables
export KMP_AFFINITY=granularity=fine,verbose,compact,1,0
export KMP_BLOCKTIME=1
export KMP_SETTINGS=1
export OMP_NUM_THREADS=$num_cores
export OMP_PROC_BIND=true

## Training
# ResNet50, batch size: 1
echo "train ResNet50 with batch size 1, layout NHWC"
python tf_cnn_benchmarks.py --device=cpu --mkl=True --kmp_blocktime=0 \
       --nodistortions --model=resnet50 --data_format=NHWC --batch_size=1 \
       --num_inter_threads=0 --num_intra_threads=72

# ResNet50, batch size: 32
echo "training ResNet50 with batch size 32, layout NHWC"
python tf_cnn_benchmarks.py --device=cpu --mkl=True --kmp_blocktime=0 \
       --nodistortions --model=resnet50 --data_format=NHWC --batch_size=32 \
       --num_inter_threads=0 --num_intra_threads=72

## Inference
# ResNet50, batch size: 1
echo "ResNet50 inference with batch size 1, layout NCHW"
python tf_cnn_benchmarks.py --forward_only=True --device=cpu --mkl=True \
       --kmp_blocktime=0 --nodistortions --model=resnet50 --data_format=NCHW \
       --batch_size=1 --num_inter_threads=1 --num_intra_threads=4 \
       #--data_dir=<path to ImageNet TFRecords>

# ResNet50, batch size: 32
echo "ResNet50 inference with batch size 32, layout NCHW"
python tf_cnn_benchmarks.py --forward_only=True --device=cpu --mkl=True \
       --kmp_blocktime=0 --nodistortions --model=resnet50 --data_format=NCHW \
       --batch_size=32 --num_inter_threads=1 --num_intra_threads=4 \
       #--data_dir=<path to ImageNet TFRecords> 
