## Wrap unit cell around molecule of interest
package require pbctools
package require hbonds
## Select index of each N and each surface Si bonded to the chain
## For the Si bidentate, list 2 indices, for tridentate list 3
set N1 [atomselect top "index 2920"]
set Si1 [atomselect top "index 512 90 588"]
set N2 [atomselect top "index 2904"]
set Si2 [atomselect top "index 1944 2020 1521"]
set N3 [atomselect top "index 2952"]
set Si3 [atomselect top "index 1232 1309 804"]
set N4 [atomselect top "index 2936"]
set Si4 [atomselect top "index 2669 2746 2240"]

set SurfOH [atomselect top "name OH and z > 10"]
set ChainO [atomselect top "name O6 O8 O10"]
set BulkO [atomselect top "name O"]
set AllO [atomselect top "element O"]
set AllN [atomselect top "element N"]

## Remove intial pdb and pqr files from loaded trajectory
#animate delete beg 0 end 0
## Determine number of frames in trajectory
set frames [molinfo top get numframes]
## Create output files
set output1 [open "ChainSurfDistance.dat" w]
puts $output1 "##Frame Chain1 Chain2 Chain3 Chain4##"
set output2 [open "ChainExtensionLength.dat" w]
puts $output2 "##Frame Chain1 Chain2 Chain3 Chain4##"
set output3 [open "ChainAngle.dat" w]
puts $output3 "##Frame Chain1 Chain2 Chain3 Chain4##"

## Trajectory loop
for {set i 0} {$i < $frames} {incr i} {
  molinfo top set frame $i
  set zN1 [lindex [measure center $N1] 2]
  set zSi1 [lindex [measure center $Si1] 2]
  set zN1dist [expr $zN1 - $zSi1]

  set zN2 [lindex [measure center $N2] 2]
  set zSi2 [lindex [measure center $Si2] 2]
  set zN2dist [expr $zN2 - $zSi2]

  set zN3 [lindex [measure center $N3] 2]
  set zSi3 [lindex [measure center $Si3] 2]
  set zN3dist [expr $zN3 - $zSi3]

  set zN4 [lindex [measure center $N4] 2]
  set zSi4 [lindex [measure center $Si4] 2]
  set zN4dist [expr $zN4 - $zSi4]

  set xN1 [lindex [measure center $N1] 0]
  set xSi1 [lindex [measure center $Si1] 0]
  set xN2 [lindex [measure center $N1] 0]
  set xSi2 [lindex [measure center $Si1] 0]
  set xN3 [lindex [measure center $N1] 0]
  set xSi3 [lindex [measure center $Si1] 0]
  set xN4 [lindex [measure center $N1] 0]
  set xSi4 [lindex [measure center $Si1] 0]

  set yN1 [lindex [measure center $N1] 1]
  set ySi1 [lindex [measure center $Si1] 1]
  set yN2 [lindex [measure center $N1] 1]
  set ySi2 [lindex [measure center $Si1] 1]
  set yN3 [lindex [measure center $N1] 1]
  set ySi3 [lindex [measure center $Si1] 1]
  set yN4 [lindex [measure center $N1] 1]
  set ySi4 [lindex [measure center $Si1] 1]

  set distN1Si1 [expr sqrt ((($xN1-$xSi1)**2)+(($yN1-$ySi1)**2)+(($zN1-$zSi1)**2))]
  set distN2Si2 [expr sqrt ((($xN2-$xSi2)**2)+(($yN2-$ySi2)**2)+(($zN2-$zSi2)**2))]
  set distN3Si3 [expr sqrt ((($xN3-$xSi3)**2)+(($yN3-$ySi3)**2)+(($zN3-$zSi3)**2))]
  set distN4Si4 [expr sqrt ((($xN4-$xSi4)**2)+(($yN4-$ySi4)**2)+(($zN4-$zSi4)**2))]

  set angN1Si1 [expr 90 - (cos($zN1dist / $distN1Si1) * 180 / 3.14159)]
  set angN2Si2 [expr 90 - (cos($zN2dist / $distN2Si2) * 180 / 3.14159)]
  set angN3Si3 [expr 90 - (cos($zN3dist / $distN3Si3) * 180 / 3.14159)]
  set angN4Si4 [expr 90 - (cos($zN4dist / $distN4Si4) * 180 / 3.14159)]

  

  ## Output to .dat file
  puts "\t \t progress: $i/$frames"
  puts $output1 "$i $zN1dist $zN2dist $zN3dist $zN4dist"
  puts $output2 "$i $distN1Si1 $distN2Si2 $distN3Si3 $distN4Si4"
  puts $output3 "$i $angN1Si1 $angN2Si2 $angN3Si3 $angN4Si4"
}

## Finishing
puts "\t \t progress: $frames/$frames"
puts "Done."
close $output1

## Calculate g(r) ##
## RDF_N--N
set gr [measure gofr $AllN $AllN delta .1 rmax 10 usepbc 1 selupdate yes first 0 last -1 step 1]
set output [open "RDF_N--N.dat" w]
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

## RDF_N--All_O
set gr [measure gofr $AllN $AllO delta .1 rmax 10 usepbc 1 selupdate yes first 0 last -1 step 1]
set output [open "RDF_N--All_O.dat" w]
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

## RDF_N--OH
set gr [measure gofr $AllN $SurfOH delta .1 rmax 10 usepbc 1 selupdate yes first 0 last -1 step 1]
set output [open "RDF_N--Surf_OH.dat" w]
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

## RDF_N--Chain_O
set gr [measure gofr $AllN $ChainO delta .1 rmax 10 usepbc 1 selupdate yes first 0 last -1 step 1]
set output [open "RDF_N--Chain_O.dat" w]
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

## RDF_N--Bulk_O
set gr [measure gofr $AllN $BulkO delta .1 rmax 10 usepbc 1 selupdate yes first 0 last -1 step 1]
set output [open "RDF_N--Bulk_O.dat" w]
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
hbonds -sel1 $AllN -sel2 $AllN -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_N--N.dat -polar yes -DA both -type unique -detailout hbonds_N--N_details.dat
hbonds -sel1 $AllN -sel2 $AllO -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_N--O.dat -polar yes -DA both -type unique -detailout hbonds_N--O_details.dat
hbonds -sel1 $AllN -sel2 $BulkO -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_N--Bulk_O.dat -polar yes -DA both -type unique -detailout hbonds_N--Bulk_O_details.dat
hbonds -sel1 $AllN -sel2 $SurfOH -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_N--SurfOH.dat -polar yes -DA both -type unique -detailout hbonds_N--SurfOH_details.dat
hbonds -sel1 $AllN -sel2 $ChainO -dist 3.5 -ang 25 -plot no -writefile yes -outfile hbonds_N--ChainO.dat -polar yes -DA both -type unique -detailout hbonds_N--ChainO_details.dat

#exit 0
