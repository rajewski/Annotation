#!/bin/bash -l
#SBATCH --ntasks=16
#SBATCH --nodes=1
#SBATCH --mem=400G
#SBATCH --time=7-00:00:00
#SBATCH --mail-user=araje002@ucr.edu
#SBATCH --mail-type=ALL
#SBATCH -p batch

# $((SLURM_MEM_PER_NODE/1000))'G'


cd ~/bigdata/Nobtusifolia/Annotation

module load funannotate/git-live

AUGUSTUS_CONFIG_PATH=/rhome/arajewski/bigdata/Csativa/augustus/config

funannotate annotate --gff ../Genome_Files/NIOBT_r1.0.new.gff --fasta ../Genome_Files/NIOBT_r1.0.fasta --proteins ../Genome_Files/NIOBT_r1.0.masked.aa --species "Nobt" --email araje002@ucr.edu --out Results/ --busco_db "embryophyta_odb9" --eggnog_db "chloroNOG" --iprscan Annotation/Results/IPROUT/iprscan.xml  --cpus $SLURM_NTASKS
