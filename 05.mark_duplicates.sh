#!/bin/bash

# Iterate over sorted BAM files
for sorted_bam_file in /work/nitinr/running/results/final_results/sorted_bam/*.sorted.bam; do
    # Extract the filename without extension
    filename=$(basename "$sorted_bam_file" .sorted.bam)
    
    # Mark Duplicates
    java -jar picard.jar MarkDuplicates I="${sorted_bam_file}" \
                                         O="/work/nitinr/running/results/final_results/dedup_bam/${filename}.sorted.dedup.bam" \
                                         M="/work/nitinr/running/results/final_results/dedup_bam/${filename}dedup.txt" \
                                         REMOVE_DUPLICATES=false \
                                         TAGGING_POLICY=All
done
