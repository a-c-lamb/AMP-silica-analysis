## Wrap unit cell around molecule of interest
package require pbctools
package require hbonds
## Select index of each N and each surface Si bonded to the chain
## For the Si bidentate, list 2 indices, for tridentate list 3

set MeOH [atomselect top "resname MOH"]
set TAG [atomselect top "resname TAG"]
##carbons at the end of the chain

## Calculate H-Bonds ##
hbonds -sel1 $MeOH -sel2 $MeOH -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_MeOH--MeOH.dat -polar yes -DA both -type unique -detailout hbonds_MeOH--MeOH_details.dat
hbonds -sel1 $MeOH -sel2 $TAG -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_MeOH--TAG.dat -polar yes -DA both -type unique -detailout hbonds_MeOH--TAG_details.dat
hbonds -sel1 $TAG -sel2 $TAG -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_TAG--TAG.dat -polar yes -DA both -type unique -detailout hbonds_TAG--TAG_details.dat



#exit 0
