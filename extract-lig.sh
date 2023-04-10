#!/bin/bash

# Loop through all files that match the pattern auto-move-*.pdb

for file in auto-move-*.pdb; do

# Extract the index from the file name
     
	index=$(echo "$file" | sed 's/auto-move-\(.*\).pdb/\1/')
     
# Use grep to search for a pattern in the file and redirect the output to a new file with the index in the name
    echo TITLE >> ligand-$index.pdb
    grep FA "$file" >> ligand-$index.pdb
    echo END >> ligand-$index.pdb
done
