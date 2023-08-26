#!/usr/bin/env bash
set -eu

# Prints usage instructions when no parameters are provided by the user.
if [ $# -lt 2 ]; then
  echo "*** This script needs arguments to work! ***"
  echo
  echo "Usage:"
  echo "./fq2fa_converter.sh INPUT_FILE OUTPUT_FILE"
  echo "Parameters:"
  echo "INPUT_FILE: FASTQ file that needs to be converted"
  echo "OUTPUT_FILE: Output FASTA file"
  echo "Example:"
  echo "./fq2fa_converter.sh input.fastq output.fasta"
  exit 1
fi

# Assigns the arguments provided by the user to the variables
INPUT_FILE=$1
OUTPUT_FILE=$2

# Extracts the headers and sequences from the input FASTQ file, and replaces "@" in the headers with ">" to generate the output FASTA file.
awk 'NR%4 == 1 {print} NR%4 == 2 {print}' $INPUT_FILE | sed '/^@/ s/^@/>/' >$OUTPUT_FILE

echo "***Successfully generated your FASTA file!***"
echo "***Thank you for using fq2fa_converter!***"
echo "***Please feel free to email your suggestions to: arsuresh@proton.me***"

