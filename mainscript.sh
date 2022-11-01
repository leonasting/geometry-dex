#!/bin/bash
#
#SBATCH --job-name=policy_knife
#SBATCH --output=srun_knife.log
#
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --time=5-10:01:00
#SBATCH --mem-per-cpu=12000
#SBATCH --mail-user=alavi.khan@sjsu.edu
#SBATCH --mail-type=END
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1

echo $PWD > /home/015898207/pwd_value.txt
echo "started_running" > /home/015898207/pwd_value.txt
python run_ddpg.py --train_names knife --test_names knife --expID 7 --video_count 0 --n_cycles 80000 --chunk 10 --point_cloud --load_path 7 --pointnet_load_path 2 --no_save_buffer  --num_parallel_envs 6 --num_rollouts 6 --n_test_rollouts 6
echo "done_running" > /home/015898207/pwd_value.txt
