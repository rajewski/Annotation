#!/bin/bash -l
#SBATCH --ntasks=16
#SBATCH --nodes=1
#SBATCH --mem=400G
#SBATCH --time=7-00:00:00
#SBATCH --mail-user=araje002@ucr.edu
#SBATCH --mail-type=ALL
#SBATCH -p batch

# $((SLURM_MEM_PER_NODE/1000))'G'

cd ~/bigdata/Csativa/

module load funannotate/git-live

AUGUSTUS_CONFIG_PATH=/rhome/arajewski/bigdata/Csativa/augustus/config

funannotate annotate -i FAPredict/predict_results/ -e araje002@ucr.edu  -s "Cannabis sativa" --isolate "Purple kush" --busco_db "embryophyta_odb9" --eggnog_db "chloroNOG" --iprscan FAPredict/predict_results/IPROUT/purple_kush.proteins.fa.xml  --cpus $SLURM_NTASKS --antismash MNPR01000001.1.final.gbk 
