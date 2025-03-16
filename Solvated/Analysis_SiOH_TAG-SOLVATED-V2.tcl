## Wrap unit cell around molecule of interest
package require pbctools
package require hbonds
## Select index of each N and each surface Si bonded to the chain
## For the Si bidentate, list 2 indices, for tridentate list 3

set SurfOH [atomselect top "name OH and z > 10"]
set BulkO [atomselect top "name O"]
set AllO [atomselect top "element O"]
set MeOH [atomselect top "resname MOH"]
set TAGcarbonylC [atomselect top "resname TAG and name C4 C10 C15"]
set TAGetherO [atomselect top "resname TAG and name O5 O14 O9"] 
set TAG [atomselect top "resname TAG"]
set TAGterminalC [atomselect top "resname TAG and name C1 C18 C13"]
set TAGcarbonylO ["resname TAG and name O19 O20 O21"]
##carbons at the end of the chain

## Calculate g(r) ##
## RDF_SurfOH--TAGcarbonylO
set gr [measure gofr $SurfOH $TAGcarbonylO delta .1 rmax 10 usepbc 1 selupdate yes first 0 last -1 step 1]
set output [open "RDF_SurfOH--TAGcarbonylO.dat" w]
puts $output "r g(r) int(r) hist(r)"
set r [lindex $gr 0]
set grout [lindex $gr 1]
set grout2 [lindex $gr 2]
set grout3 [lindex $gr 3]
set i 0
foreach j $r k $grout l $grout2 m $grout3 {
  puts $output "$j $k $l $m"
  }
close $output


## RDF_Silanol--TAG
set gr [measure gofr $SurfOH $TAG delta .1 rmax 10 usepbc 1 selupdate yes first 0 last -1 step 1]
set output [open "RDF_SurfOH--TAG.dat" w]
puts $output "r g(r) int(r) hist(r)"
set r [lindex $gr 0]
set grout [lindex $gr 1]
set grout2 [lindex $gr 2]
set grout3 [lindex $gr 3]
set i 0
foreach j $r k $grout l $grout2 m $grout3 {
  puts $output "$j $k $l $m"
  }
close $output

## Calculate H-Bonds ##
hbonds -sel1 $SurfOH -sel2 $TAG -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_SurfOH--TAG.dat -polar yes -DA both -type unique -detailout hbonds_SurfOH--TAG_details.dat



#exit 0
