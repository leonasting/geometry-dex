#!/bin/bash
#
#SBATCH --job-name=policy_train
#SBATCH --output=pl2ap-srun.log
#
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --time=23:01:00
#SBATCH --mem-per-cpu=2000
#SBATCH --mail-user=alavi.khan@sjsu.edu
#SBATCH --mail-type=END
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1

python run_ddpg.py --expID 3 --video_count 0 --n_cycles 40000 --chunk 10 --point_cloud --pointnet_load_path 2 --no_save_buffer --load_path 3 --n_test_rollouts 30 --num_rollouts 30 --num_parallel_envs 30

