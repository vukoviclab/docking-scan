#!/bin/bash
mkdir result-seed1
receptor=protein.pdbqt # the protein PDBQT name
ligand=ligand.pdbqt # the ligand PDBQT name
box_size=12 # t
for x in $(seq -9 5 37)
	do
		for y in $(seq -23 5 18)
			do
				for z in $(seq 38 5 75)
					do
echo "receptor = $receptor 
ligand = $ligand

center_x = $(echo $x)
center_y = $(echo $y)
center_z = $(echo $z)
			
size_x = $box_size
size_y = $box_size
size_z = $box_size" >> conf-$x-$y-$z

./vina --config conf-$x-$y-$z --num_modes 100 --energy_range 3 --cpu 8 --out pdbq-$x-$y-$z.pdbqt --log log-$x-$y-$z.log --seed 1
echo " $(echo $x),$(echo $y),$(echo $z),$(sed -n '25p' log-$x-$y-$z.log | cut -c10-17)">> affinity-seed1.csv

mv conf-$x-$y-$z result-seed1
mv pdbq-$x-$y-$z.pdbqt result-seed1
mv log-$x-$y-$z.log result-seed1
				
					done	
			done
		done


