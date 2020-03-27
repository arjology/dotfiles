autoload zmv
export CUDA_HOME=/usr/local/cuda
export CUDA_ROOT=$CUDA_HOME/bin/
export PATH=${CUDA_HOME}/bin:${PATH}
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:$LD_LIBRARY_PATH
