#!/bin/bash

# Iterate over BAM files
for bam_file in /work/nitinr/running/results/final_results/bam/*.bam; do
    # Extract the filename without extension
    filename=$(basename "$bam_file" .bam)
    
    # Sort BAM
    samtools sort "${bam_file}" > "/work/nitinr/running/results/final_results/sorted_bam/${filename}.sorted.bam"
done
