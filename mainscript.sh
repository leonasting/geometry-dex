#!/bin/bash
#
#SBATCH --job-name=policy_train
#SBATCH --output=pl2ap-srun.log
#
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=20
#SBATCH --time=5-10:01:00
#SBATCH --mem-per-cpu=2000
#SBATCH --mail-user=alavi.khan@sjsu.edu
#SBATCH --mail-type=END
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1

python run_ddpg.py --expID 4 --video_count 0 --n_cycles 40000 --chunk 10 --point_cloud --pointnet_load_path 2 --no_save_buffer --load_path 4 --n_test_rollouts 300 --num_rollouts 300 --num_parallel_envs 300

