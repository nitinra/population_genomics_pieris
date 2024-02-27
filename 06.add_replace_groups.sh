#!/bin/bash

# Iterate over sorted and deduplicated BAM files
for dedup_sorted_bam_file in /work/nitinr/running/results/final_results/dedup_bam/*.sorted.dedup.bam; do
    # Extract the filename without extension
    filename=$(basename "$dedup_sorted_bam_file" .sorted.dedup.bam)
    
    # Add or Replace Read Groups
    java -jar picard.jar AddOrReplaceReadGroups I="${dedup_sorted_bam_file}" \
                                                O="/work/nitinr/running/results/final_results/read_group_bam/${filename}.addrep.sorted.dedup.bam" \
                                                RGID=HGLY3CCX2.2 \
                                                RGLB=lib1 \
                                                RGPL=illumina \
                                                RGPU=HGLY3CCX2.2."${filename}" \
                                                RGSM="${filename}"
done
