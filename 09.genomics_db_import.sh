#!/bin/bash

# Define the reference genome file
REFERENCE="Pmac_annotated.fasta"
# Define the file containing the list of VCF files
VCF_LIST_FILE="vcf_files.txt"

# Check if the VCF list file exists
if [ ! -f "$VCF_LIST_FILE" ]; then
    echo "Error: VCF list file '$VCF_LIST_FILE' not found!"
    exit 1
fi

# Loop over each VCF file listed in the file
while IFS= read -r VCF || [[ -n "$VCF" ]]; do
    echo "Processing $VCF"
    gatk GenomicsDBImport -R "$REFERENCE" -V "$VCF" --genomicsdb-workspace-path allgvcf -L intervals.list
done < "$VCF_LIST_FILE" 

# Genotype GVCFs
gatk GenotypeGVCFs -R Pmac_annotated.fasta -V gendb://allgvcf -stand-call-conf 30.0 -all-sites -L intervals.list -O allsampleallsites.vcf.gz


## intervals.list is a file containing the length and identity of the chromosomes.

