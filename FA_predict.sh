#!/bin/bash -l
#SBATCH --ntasks=64
#SBATCH --nodes=1

cd ~/bigdata/Csativa/

module load funannotate/git-live
module load diamond

AUGUSTUS_CONFIG_PATH=/rhome/arajewski/bigdata/Csativa/augustus/config

funannotate predict --masked_genome GCA_001865755.1_ASM186575v1_genomic.filtered.fna -o FAPredict -s "Purple Kush" --busco_db "embryophyta_odb9" --organism "other" --transcript_evidence canSat3_transcriptome-full.fa --repeatmasker_gff3 GCA_001865755.1_ASM186575v1_rm.out --cpus 64 --busco_seed_species 'arabidopsis' --use_diamond
