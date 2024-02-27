#!/bin/bash

# Iterate over BAM files
for bam_file in /work/nitinr/running/results/final_results/read_group_bam/*.bam; do
    # Index BAM
    samtools index "${bam_file}"
done
