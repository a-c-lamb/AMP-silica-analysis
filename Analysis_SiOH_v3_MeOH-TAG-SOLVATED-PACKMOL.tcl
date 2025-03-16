## Wrap unit cell around molecule of interest
package require pbctools
package require hbonds
## Select index of each N and each surface Si bonded to the chain
## For the Si bidentate, list 2 indices, for tridentate list 3

set SurfOH [atomselect top "name OH and z > 10"]
set ChainO [atomselect top "name O6 O8 O10"]
set BulkO [atomselect top "name O and resname SURF"]

set MeOH [atomselect top "resname MOH"]
set MethylO [atomselect top "resname MOH and name O5"]
set MethylC [atomselect top "resname MOH and name C2"]

set TAGcarbonylC [atomselect top "resname TAG and name C4 C10 C15"]
set TAGetherO [atomselect top "resname TAG and name O5 O14 O9"] 
set TAG [atomselect top "resname TAG"]
set TAGterminalC [atomselect top "resname TAG and name C1 C18 C13"]
set TAGcarbonylO [atomselect top "resname TAG and name O19 O20 O21"]

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

##TAG-amine/surface
#
## RDF_BulkO--TAG
set gr [measure gofr $BulkO $TAG delta .1 rmax 10 usepbc 1 selupdate yes first 0 last -1 step 1]
set output [open "RDF_BulkO--TAG.dat" w]
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

## RDF_SurfOH--TAG
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


## RDF_SurfOH--TAGetherO
set gr [measure gofr $SurfOH $TAGetherO delta .1 rmax 10 usepbc 1 selupdate yes first 0 last -1 step 1]
set output [open "RDF_SurfOH--TAGetherO.dat" w]
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




## RDF_BulkO--TAGetherO
set gr [measure gofr $BulkO $TAGetherO delta .1 rmax 10 usepbc 1 selupdate yes first 0 last -1 step 1]
set output [open "RDF_BulkO--TAGetherO.dat" w]
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



##Solvent interactions
## RDF_TAG--MeOH
set gr [measure gofr $TAG $MeOH delta .1 rmax 10 usepbc 1 selupdate yes first 0 last -1 step 1]
set output [open "RDF_TAG--MeOH.dat" w]
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

## RDF_TAG--TAG
set gr [measure gofr $TAG $TAG delta .1 rmax 10 usepbc 1 selupdate yes first 0 last -1 step 1]
set output [open "RDF_TAG--TAG.dat" w]
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

## RDF_MeOH--MeOH
set gr [measure gofr $MeOH $MeOH delta .1 rmax 10 usepbc 1 selupdate yes first 0 last -1 step 1]
set output [open "RDF_MeOH--MeOH.dat" w]
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

hbonds -sel1 $TAGetherO -sel2 $BulkO -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_TAGetherO--Bulk_O.dat -polar yes -DA both -type unique -detailout hbonds_TAGetherO--Bulk_O_details.dat
hbonds -sel1 $TAGetherO -sel2 $SurfOH -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_TAGetherO--SurfOH.dat -polar yes -DA both -type unique -detailout hbonds_TAGetherO--SurfOH_details.dat

hbonds -sel1 $TAGcarbonylO -sel2 $BulkO -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_TAGcarbonylO--Bulk_O.dat -polar yes -DA both -type unique -detailout hbonds_TAGcarbonylO--Bulk_O_details.dat
hbonds -sel1 $TAGcarbonylO -sel2 $SurfOH -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_TAGcarbonylO--SurfOH.dat -polar yes -DA both -type unique -detailout hbonds_TAGcarbonylO--SurfOH_details.dat

hbonds -sel1 $SurfOH -sel2 $TAG -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_SurfOH--TAG.dat -polar yes -DA both -type unique -detailout hbonds_SurfOH--TAG_details.dat

hbonds -sel1 $BulkO -sel2 $MeOH -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_BulkO--MeOH.dat -polar yes -DA both -type unique -detailout hbonds_BulkO--MeOH_details.dat
hbonds -sel1 $SurfOH -sel2 $MeOH -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_SurfOH--MeOH.dat -polar yes -DA both -type unique -detailout hbonds_SurfOH--MeOH_details.dat

hbonds -sel1 $MeOH -sel2 $TAG -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_MeOH--TAG.dat -polar yes -DA both -type unique -detailout hbonds_MeOH--TAG_details.dat


#exit 0
