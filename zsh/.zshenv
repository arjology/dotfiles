autoload zmv
export CUDA_HOME=/usr/local/cuda
export CUDA_ROOT=$CUDA_HOME/bin/
export PATH=${CUDA_HOME}/bin:${PATH}
export PATH="/usr/local/jvm/java/bin":$PATH
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:$LD_LIBRARY_PATH
export TERM=xterm-24bit
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
alias fb_fix="/usr/local/bin/cc-certs && sudo soloctl -i"
