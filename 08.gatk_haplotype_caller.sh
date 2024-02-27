#!/bin/bash

# Iterate over BAM files and call HaplotypeCaller
for bam_file in /work/nitinr/running/results/final_results/read_group_bam/*.bam; do
    filename=$(basename "$bam_file" .addrep.sorted.dedup.bam)
    gatk HaplotypeCaller -I "$bam_file" -R Pmac_annotated.fasta -ERC GVCF -O "${filename}.g.vcf"
done
