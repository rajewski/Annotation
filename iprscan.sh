#!/bin/bash -l
#SBATCH --ntasks=16
#SBATCH --nodes=1
#SBATCH --mem=200G
#SBATCH --time=05:00:00
#SBATCH --mail-user=araje002@ucr.edu
#SBATCH --mail-type=ALL

# $((SLURM_MEM_PER_NODE/1000))'G'
# $SLURM_NTASKS
# $SLURM_ARRAY_TASK_ID

cd ~/bigdata/Nobtusifolia/Annotation/Results

module load interproscan

if [ ! -d "$IPROUT" ]; then
  mkdir IPROUT
fi

interproscan.sh -i ../../Genome_Files/NIOBT_r1.0.masked.aa.$SLURM_ARRAY_TASK_ID -appl CDD,COILS,Gene3D,MobiDBLite,Pfam,PIRSF,PRINTS,ProDom,PROSITEPATTERNS,PROSITEPROFILES,SFLD,SMART,SUPERFAMILY,TIGRFAM,SignalP_EUK -d IPROUT --goterms
