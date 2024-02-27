#!/bin/bash

# Iterate over input files
for file in /work/nitinr/running/results/final_results/fastp/trimmed/*.fastq; do
    # Extract the filename without extension
    filename=$(basename "$file" .fastq)

    # Run bwa mem command
    bwa mem /work/nitinr/running/results/final_results/Pmac_annotated.fasta.gz \
            "${file}" \
            "/work/nitinr/running/results/final_results/fastp/trimmed/${filename}_R2.fastq" \
            > "/work/nitinr/running/results/final_results/sam/${filename}.sam"
done
