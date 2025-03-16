## Wrap unit cell around molecule of interest
package require pbctools
package require hbonds
## Select index of each N and each surface Si bonded to the chain
## For the Si bidentate, list 2 indices, for tridentate list 3

set SurfOH [atomselect top "name OH and z > 10"]
set ChainO [atomselect top "name O6 O8 O10"]
set BulkO [atomselect top "name O"]
set AllO [atomselect top "element O"]
set AllN [atomselect top "element N"]
set MeOH [atomselect top "resname MOH"]
set MethylO [atomselect top "resname MOH and name O5"]
set MethylC [atomselect top "resname MOH and name C2"]

## Calculate g(r) ##

## RDF_MeOH--OH
set gr [measure gofr $MeOH $SurfOH delta .1 rmax 10 usepbc 1 selupdate yes first 0 last -1 step 1]
set output [open "RDF_MeOH--Surf_OH.dat" w]
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

## RDF_MethylO--OH
set gr [measure gofr $MethylO $SurfOH delta .1 rmax 10 usepbc 1 selupdate yes first 0 last -1 step 1]
set output [open "RDF_MethylO--Surf_OH.dat" w]
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

## RDF_MethylC--OH
set gr [measure gofr $MethylC $SurfOH delta .1 rmax 10 usepbc 1 selupdate yes first 0 last -1 step 1]
set output [open "RDF_MethylC--Surf_OH.dat" w]
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

## RDF_MeOH--BulkO
set gr [measure gofr $MeOH $BulkO delta .1 rmax 10 usepbc 1 selupdate yes first 0 last -1 step 1]
set output [open "RDF_MeOH--BulkO.dat" w]
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

## RDF_MethylO--BulkO
set gr [measure gofr $MethylO $BulkO delta .1 rmax 10 usepbc 1 selupdate yes first 0 last -1 step 1]
set output [open "RDF_MethylO--BulkO.dat" w]
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

## RDF_MethylC--BulkO
set gr [measure gofr $MethylC $BulkO delta .1 rmax 10 usepbc 1 selupdate yes first 0 last -1 step 1]
set output [open "RDF_MethylC--BulkO.dat" w]
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


hbonds -sel1 $BulkO -sel2 $MeOH -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_BulkO--MeOH.dat -polar yes -DA both -type unique -detailout hbonds_BulkO--MeOH_details.dat
hbonds -sel1 $SurfOH -sel2 $MeOH -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_SurfOH--MeOH.dat -polar yes -DA both -type unique -detailout hbonds_SurfOH--MeOH_details.dat




#exit 0
