#!/bin/bash

mkdir s-4.0
var=`cat s-4.0.csv | wc -l`
setnum=-1.0
for (( c=1; c<=$var; c++ ))
do
	energ=`cut -d ',' -f 4  s-4.0.csv | sed -n $(echo $c)p `
	if (( $(echo "$setnum > $energ" |bc -l) ));
	then
		x=`cut -d ',' -f 1 s-4.0.csv | sed -n $(echo $c)p `
		y=`cut -d ',' -f 2 s-4.0.csv | sed -n $(echo $c)p `
		z=`cut -d ',' -f 3 s-4.0.csv | sed -n $(echo $c)p `

		vina_split --input ./result-seed1/pdbq-$x-$y-$z.pdbqt 

cut -c1-60 ./result-seed1/pdbq-$(echo $x)-$(echo $y)-$(echo $z)_ligand_01.pdbqt | grep  HETATM > temp2
paste -d " " temp2 > lig-$x-$y-$z.pdb
echo "END" >> lig-$x-$y-$z.pdb
cat  new-protein.pdb >> final-$x-$y-$z.pdb
cat lig-$x-$y-$z.pdb >> final-$x-$y-$z.pdb
mv final-$x-$y-$z.pdb s-4.0/

	fi

done

