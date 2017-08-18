#!/bin/bash

cd ~/bigdata/Notbusifolia/Genome_Files
#clean up stop codons, which is probably an indicator of a bad protein prediction, but whatever....
sed -e '/^[^>]/s/*/X/g' NIOBT_r1.0.aa > NIOBT_r1.0.masked.aa

module load genometools
gt splitfasta --numfiles 6 NIOBT_r1.0.masked.aa
