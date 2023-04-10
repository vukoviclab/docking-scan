# Protein Surface Scanning with AutoDock Vina

This repository contains Bash scripts for scanning the protein surface using the AutoDock Vina software. These scripts automate the process of obtaining protein and ligand PDBQT structures, scanning the protein surface along the x, y, and z axes, and saving the coordinates, binding affinity scores, and PDBQT structures.

## Script Descriptions

### `vinasc.sh`

This script automates the process of obtaining the protein and ligand PDBQT structures and scanning the protein surface. It features three nested for loops to scan the protein surface along the x, y, and z axes. Users can modify the numbers within the loops according to their specific protein structure requirements. The script will save the coordinates, binding affinity scores, and all the generated PDBQT structures.

### `split.sh`

This script splits the PDBQT files and converts them to the PDB format. It is useful for further analysis or visualization of the protein-ligand complexes.

## Usage

1. Place your protein and ligand files in the appropriate formats within the same directory as the scripts.

2. Ensure that the AutoDock Vina software is installed and the executable is in your `$PATH`.

3. Customize the parameters in `vinasc.sh` to match your specific protein structure.

4. Run the scripts in the following order:

   ```bash
   ./vinasc.sh
   ./split.sh
5. Analyze the generated PDB files and binding affinity scores.
Please refer to the AutoDock Vina documentation for more information on how to use and configure the software: http://vina.scripps.edu/manual.html
