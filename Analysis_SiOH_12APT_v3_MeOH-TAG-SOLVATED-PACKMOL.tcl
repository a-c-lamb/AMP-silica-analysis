## Wrap unit cell around molecule of interest
package require pbctools
package require hbonds
## Select index of each N and each surface Si bonded to the chain
## For the Si bidentate, list 2 indices, for tridentate list 3
set N1 [atomselect top "index 2984"]
set Si1 [atomselect top "index 510 586 89"]
set N2 [atomselect top "index 3000"]
set Si2 [atomselect top "index 463 492 209"]
set N3 [atomselect top "index 3016"]
set Si3 [atomselect top "index 2085 1919 1749"]
set N4 [atomselect top "index 3032"]
set Si4 [atomselect top "index 1495 1991 1915"]
set N5 [atomselect top "index 2936"]
set Si5 [atomselect top "index 2111 1472 1592"]
set N6 [atomselect top "index 2968"]
set Si6 [atomselect top "index 2068 1918 2"]
set N7 [atomselect top "index 2904"]
set Si7 [atomselect top "index 1383 187 705"]
set N8 [atomselect top "index 2920"]
set Si8 [atomselect top "index 1146 1394 916"]
set N9 [atomselect top "index 2952"]
set Si9 [atomselect top "index 2626 2702 2200"]
set N10 [atomselect top "index 2888"]
set Si10 [atomselect top "index 2442 2460 2530"]
set N11 [atomselect top "index 2872"]
set Si11 [atomselect top "index 1219 793 1295"]
set N12 [atomselect top "index 2856"]
set Si12 [atomselect top "index 1379 1222 1123"]

set SurfOH [atomselect top "name OH and z > 10"]
set ChainO [atomselect top "name O6 O8 O10"]
set BulkO [atomselect top "name O and resname SURF"]
set AllN [atomselect top "element N"]

set MeOH [atomselect top "resname MOH"]
set MethylO [atomselect top "resname MOH and name O5"]
set MethylC [atomselect top "resname MOH and name C2"]

set TAGcarbonylC [atomselect top "resname TAG and name C4 C10 C15"]
set TAGetherO [atomselect top "resname TAG and name O5 O14 O9"] 
set TAG [atomselect top "resname TAG"]
set TAGterminalC [atomselect top "resname TAG and name C1 C18 C13"]
set TAGcarbonylO [atomselect top "resname TAG and name O19 O20 O21"]


  

## Calculate H-Bonds ##
hbonds -sel1 $AllN -sel2 $AllN -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_N--N.dat -polar yes -DA both -type unique -detailout hbonds_N--N_details.dat
hbonds -sel1 $AllN -sel2 $BulkO -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_N--Bulk_O.dat -polar yes -DA both -type unique -detailout hbonds_N--Bulk_O_details.dat
hbonds -sel1 $AllN -sel2 $SurfOH -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_N--SurfOH.dat -polar yes -DA both -type unique -detailout hbonds_N--SurfOH_details.dat
hbonds -sel1 $AllN -sel2 $ChainO -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_N--ChainO.dat -polar yes -DA both -type unique -detailout hbonds_N--ChainO_details.dat


hbonds -sel1 $SurfOH -sel2 $TAG -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_SurfOH--TAG.dat -polar yes -DA both -type unique -detailout hbonds_SurfOH--TAG_details.dat
hbonds -sel1 $AllN -sel2 $TAG -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_AllN--TAG.dat -polar yes -DA both -type unique -detailout hbonds_N--TAG_details.dat

hbonds -sel1 $AllN -sel2 $MeOH -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_N--MeOH.dat -polar yes -DA both -type unique -detailout hbonds_N--MeOH_details.dat
hbonds -sel1 $BulkO -sel2 $MeOH -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_BulkO--MeOH.dat -polar yes -DA both -type unique -detailout hbonds_BulkO--MeOH_details.dat
hbonds -sel1 $SurfOH -sel2 $MeOH -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_SurfOH--MeOH.dat -polar yes -DA both -type unique -detailout hbonds_SurfOH--MeOH_details.dat

hbonds -sel1 $MeOH -sel2 $TAG -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_MeOH--TAG.dat -polar yes -DA both -type unique -detailout hbonds_MeOH--TAG_details.dat


#exit 0
