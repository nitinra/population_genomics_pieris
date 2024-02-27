#!/bin/bash

# Iterate over SAM files
for sam_file in /work/nitinr/running/results/final_results/sam/*.sam; do
    # Extract the filename without extension
    filename=$(basename "$sam_file" .sam)
    
    # Convert SAM to BAM
    samtools view -f 2 -S -b "${sam_file}" > "/work/nitinr/running/results/final_results/bam/${filename}.bam"
done
