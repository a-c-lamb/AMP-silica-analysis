## Wrap unit cell around molecule of interest
package require pbctools
package require hbonds
## Select index of each N and each surface Si bonded to the chain
## For the Si bidentate, list 2 indices, for tridentate list 3
set N1 [atomselect top "index 3000"]
set Si1 [atomselect top "index 510 673 342"]
set N2 [atomselect top "index 2936"]
set Si2 [atomselect top "index 506 89 582"]
set N3 [atomselect top "index 2952"]
set Si3 [atomselect top "index 459 488 208"]
set N4 [atomselect top "index 2968"]
set Si4 [atomselect top "index 1726 1896 2055"]
set N5 [atomselect top "index 3064"]
set Si5 [atomselect top "index 2047 1389 1845"]
set N6 [atomselect top "index 3048"]
set Si6 [atomselect top "index 1591 2054 1820"]
set N7 [atomselect top "index 2984"]
set Si7 [atomselect top "index 1892 1967 1472"]
set N8 [atomselect top "index 2920"]
set Si8 [atomselect top "index 2 2042 1895"]
set N9 [atomselect top "index 3016"]
set Si9 [atomselect top "index 509 411 324"]
set N10 [atomselect top "index 3032"]
set Si10 [atomselect top "index 1041 1210 1376"]
set N11 [atomselect top "index 2808"]
set Si11 [atomselect top "index 1360 1209 1110"]
set N12 [atomselect top "index 2824"]
set Si12 [atomselect top "index 1282 1206 781"]
set N13 [atomselect top "index 2856"]
set Si13 [atomselect top "index 186 1364 693"]
set N14 [atomselect top "index 3096"]
set Si14 [atomselect top "index 2591 688 1187"]
set N15 [atomselect top "index 2872"]
set Si15 [atomselect top "index 903 1375 1133"]
set N16 [atomselect top "index 2840"]
set Si16 [atomselect top "index 2422 2492 2404"]
set N17 [atomselect top "index 3112"]
set Si17 [atomselect top "index 1432 2750 2759"]
set N18 [atomselect top "index 2888"]
set Si18 [atomselect top "index 1569 2075 1449"]
set N19 [atomselect top "index 3080"]
set Si19 [atomselect top "index 2285 2758 2515"]
set N20 [atomselect top "index 2904"]
set Si20 [atomselect top "index 2163 2664 2588"]


set SurfOH [atomselect top "name OH and z > 10"]
set ChainO [atomselect top "name O6 O8 O10"]
set BulkO [atomselect top "name O"]
set AllO [atomselect top "element O"]
set AllN [atomselect top "element N"]
set MeOH [atomselect top "resname MOH"]

## Calculate H-Bonds ##
#hbonds -sel1 $AllN -sel2 $AllN -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_N--N.dat -polar yes -DA both -type unique -detailout hbonds_N--N_details.dat
#hbonds -sel1 $AllN -sel2 $BulkO -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_N--Bulk_O.dat -polar yes -DA both -type unique -detailout hbonds_N--Bulk_O_details.dat
#hbonds -sel1 $AllN -sel2 $SurfOH -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_N--SurfOH.dat -polar yes -DA both -type unique -detailout hbonds_N--SurfOH_details.dat
hbonds -sel1 $AllN -sel2 $MeOH -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_N--MeOH.dat -polar yes -DA both -type unique -detailout hbonds_N--MeOH_details.dat
hbonds -sel1 $SurfOH -sel2 $MeOH -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_SurfOH--MeOH.dat -polar yes -DA both -type unique -detailout hbonds_SurfOH--MeOH_details.dat

#exit 0
