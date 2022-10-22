!/bin/bash
#
#SBATCH --job-name=test_check
#SBATCH --output=test.log
#
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=6
#SBATCH --time=5-10:01:00
#SBATCH --mem-per-cpu=2000
#SBATCH --mail-user=alavi.khan@sjsu.edu
#SBATCH --mail-type=END
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1


echo $PWD > /home/015898207/pwd_value.txt
