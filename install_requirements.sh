# https://www.tensorflow.org/install/pip

source $HOME/miniconda3/bin/activate

conda create --yes --name=tf python=3.9
conda activate tf

conda install -y -c conda-forge cudatoolkit=11.2 cudnn=8.1.0

mkdir -p $CONDA_PREFIX/etc/conda/activate.d

sudo cp env_vars.sh $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh

pip install --upgrade pip

pip install -r requirements.txt