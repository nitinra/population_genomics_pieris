#!/bin/bash

# Iterate over input files
for file in /work/nitinr/running/data/concat_all/*.fastq.gz; do
    # Extract the filename without extension
    filename=$(basename "$file" .fastq.gz)

    # Run fastp command
    fastp -i "${file}" -I "/work/nitinr/running/data/concat_all/${filename}_R2.fastq.gz" \
          -o "/work/nitinr/running/results/final_results/fastp/trimmed/${filename}_R1.fastq" \
          -O "/work/nitinr/running/results/final_results/fastp/trimmed/${filename}_R2.fastq" \
          -j "/work/nitinr/running/results/final_results/fastp/json/${filename}.json" \
          -h "/work/nitinr/running/results/final_results/fastp/html/${filename}.html" \
          --unpaired1 "/work/nitinr/running/results/final_results/fastp/unpaired/${filename}_R12_unpaired.fastq" \
          --unpaired2 "/work/nitinr/running/results/final_results/fastp/unpaired/${filename}_R21_unpaired.fastq" \
          --failed_out "/work/nitinr/running/results/final_results/fastp/failed/${filename}.failed.out" \
          -p -g --qualified_quality_phred=15 --length_required=15 -c
done
