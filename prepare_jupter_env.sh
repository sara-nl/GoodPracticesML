#!/bin/bash
#SBATCH -t 8:00:00
#SBATCH -N 1
#SBATCH -p normal
#SBATCH --reservation=course_dl_11


module load Python/3.6.3-foss-2017b
module load cuDNN/7.4.2-CUDA-10.0.130
virtualenv ml_course

source ml_course/bin/activate

pip install scikit-learn scikit-image numpy pandas matplotlib keras keras-vis tqdm jupyter seaborn
pip install scipy==1.1.0 --force-reinstall --ignore-installed

PORT=$(whoami | cut -c4-6)
PORT="5$PORT"

ssh -o StrictHostKeyChecking=no -f -N -p 22 -R $PORT:localhost:$PORT login4

jupyter notebook --no-browser --port $PORT
