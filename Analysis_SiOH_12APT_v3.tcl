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
set BulkO [atomselect top "name O"]
set AllO [atomselect top "element O"]
set AllN [atomselect top "element N"]

## Remove intial pdb and pqr files from loaded trajectory
#animate delete beg 0 end 0
## Determine number of frames in trajectory
set frames [molinfo top get numframes]
## Create output files
set output1 [open "ChainSurfDistance.dat" w]
puts $output1 "##Frame Chain1 Chain2 Chain3 Chain4 Chain5 Chain6 Chain7 Chain8 Chain9 Chain10 Chain11 Chain12##"
set output2 [open "ChainExtensionLength.dat" w]
puts $output2 "##Frame Chain1 Chain2 Chain3 Chain4 Chain5 Chain6 Chain7 Chain8 Chain9 Chain10 Chain11 Chain12##"
set output3 [open "ChainAngle.dat" w]
puts $output3 "##Frame Chain1 Chain2 Chain3 Chain4 Chain5 Chain6 Chain7 Chain8 Chain9 Chain10 Chain11 Chain12##"

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

  set zN5 [lindex [measure center $N5] 2]
  set zSi5 [lindex [measure center $Si5] 2]
  set zN5dist [expr $zN5 - $zSi5]

  set zN6 [lindex [measure center $N6] 2]
  set zSi6 [lindex [measure center $Si6] 2]
  set zN6dist [expr $zN6 - $zSi6]

  set zN7 [lindex [measure center $N7] 2]
  set zSi7 [lindex [measure center $Si7] 2]
  set zN7dist [expr $zN7 - $zSi7]

  set zN8 [lindex [measure center $N8] 2]
  set zSi8 [lindex [measure center $Si8] 2]
  set zN8dist [expr $zN8 - $zSi8]

  set zN9 [lindex [measure center $N9] 2]
  set zSi9 [lindex [measure center $Si9] 2]
  set zN9dist [expr $zN9 - $zSi9]

  set zN10 [lindex [measure center $N10] 2]
  set zSi10 [lindex [measure center $Si10] 2]
  set zN10dist [expr $zN10 - $zSi10]

  set zN11 [lindex [measure center $N11] 2]
  set zSi11 [lindex [measure center $Si11] 2]
  set zN11dist [expr $zN11 - $zSi11]

  set zN12 [lindex [measure center $N12] 2]
  set zSi12 [lindex [measure center $Si12] 2]
  set zN12dist [expr $zN12 - $zSi12]


  set xN1 [lindex [measure center $N1] 0]
  set xSi1 [lindex [measure center $Si1] 0]
  set xN2 [lindex [measure center $N2] 0]
  set xSi2 [lindex [measure center $Si2] 0]
  set xN3 [lindex [measure center $N3] 0]
  set xSi3 [lindex [measure center $Si3] 0]
  set xN4 [lindex [measure center $N4] 0]
  set xSi4 [lindex [measure center $Si4] 0]
  set xN5 [lindex [measure center $N5] 0]
  set xSi5 [lindex [measure center $Si5] 0]
  set xN6 [lindex [measure center $N6] 0]
  set xSi6 [lindex [measure center $Si6] 0]
  set xN7 [lindex [measure center $N7] 0]
  set xSi7 [lindex [measure center $Si7] 0]
  set xN8 [lindex [measure center $N8] 0]
  set xSi8 [lindex [measure center $Si8] 0]
  set xN9 [lindex [measure center $N9] 0]
  set xSi9 [lindex [measure center $Si9] 0]
  set xN10 [lindex [measure center $N10] 0]
  set xSi10 [lindex [measure center $Si10] 0]
  set xN11 [lindex [measure center $N11] 0]
  set xSi11 [lindex [measure center $Si11] 0]
  set xN12 [lindex [measure center $N12] 0]
  set xSi12 [lindex [measure center $Si12] 0]

  set yN1 [lindex [measure center $N1] 1]
  set ySi1 [lindex [measure center $Si1] 1]
  set yN2 [lindex [measure center $N2] 1]
  set ySi2 [lindex [measure center $Si2] 1]
  set yN3 [lindex [measure center $N3] 1]
  set ySi3 [lindex [measure center $Si3] 1]
  set yN4 [lindex [measure center $N4] 1]
  set ySi4 [lindex [measure center $Si4] 1]
  set yN5 [lindex [measure center $N5] 1]
  set ySi5 [lindex [measure center $Si5] 1]
  set yN6 [lindex [measure center $N6] 1]
  set ySi6 [lindex [measure center $Si6] 1]
  set yN7 [lindex [measure center $N7] 1]
  set ySi7 [lindex [measure center $Si7] 1]
  set yN8 [lindex [measure center $N8] 1]
  set ySi8 [lindex [measure center $Si8] 1]
  set yN9 [lindex [measure center $N9] 1]
  set ySi9 [lindex [measure center $Si9] 1]
  set yN10 [lindex [measure center $N10] 1]
  set ySi10 [lindex [measure center $Si10] 1]
  set yN11 [lindex [measure center $N11] 1]
  set ySi11 [lindex [measure center $Si11] 1]
  set yN12 [lindex [measure center $N12] 1]
  set ySi12 [lindex [measure center $Si12] 1]

  set distN1Si1 [expr sqrt ((($xN1-$xSi1)**2)+(($yN1-$ySi1)**2)+(($zN1-$zSi1)**2))]
  set distN2Si2 [expr sqrt ((($xN2-$xSi2)**2)+(($yN2-$ySi2)**2)+(($zN2-$zSi2)**2))]
  set distN3Si3 [expr sqrt ((($xN3-$xSi3)**2)+(($yN3-$ySi3)**2)+(($zN3-$zSi3)**2))]
  set distN4Si4 [expr sqrt ((($xN4-$xSi4)**2)+(($yN4-$ySi4)**2)+(($zN4-$zSi4)**2))]
  set distN5Si5 [expr sqrt ((($xN5-$xSi5)**2)+(($yN5-$ySi5)**2)+(($zN5-$zSi5)**2))]
  set distN6Si6 [expr sqrt ((($xN6-$xSi6)**2)+(($yN6-$ySi6)**2)+(($zN6-$zSi6)**2))]
  set distN7Si7 [expr sqrt ((($xN7-$xSi7)**2)+(($yN7-$ySi7)**2)+(($zN7-$zSi7)**2))]
  set distN8Si8 [expr sqrt ((($xN8-$xSi8)**2)+(($yN8-$ySi8)**2)+(($zN8-$zSi8)**2))]
  set distN9Si9 [expr sqrt ((($xN9-$xSi9)**2)+(($yN9-$ySi9)**2)+(($zN9-$zSi9)**2))]
  set distN10Si10 [expr sqrt ((($xN10-$xSi10)**2)+(($yN10-$ySi10)**2)+(($zN10-$zSi10)**2))]
  set distN11Si11 [expr sqrt ((($xN11-$xSi11)**2)+(($yN11-$ySi11)**2)+(($zN11-$zSi11)**2))]
  set distN12Si12 [expr sqrt ((($xN12-$xSi12)**2)+(($yN12-$ySi12)**2)+(($zN12-$zSi12)**2))]

  set angN1Si1 [expr 90 - (cos($zN1dist / $distN1Si1) * 180 / 3.14159)]
  set angN2Si2 [expr 90 - (cos($zN2dist / $distN2Si2) * 180 / 3.14159)]
  set angN3Si3 [expr 90 - (cos($zN3dist / $distN3Si3) * 180 / 3.14159)]
  set angN4Si4 [expr 90 - (cos($zN4dist / $distN4Si4) * 180 / 3.14159)]
  set angN5Si5 [expr 90 - (cos($zN5dist / $distN5Si5) * 180 / 3.14159)]
  set angN6Si6 [expr 90 - (cos($zN6dist / $distN6Si6) * 180 / 3.14159)]
  set angN7Si7 [expr 90 - (cos($zN7dist / $distN7Si7) * 180 / 3.14159)]
  set angN8Si8 [expr 90 - (cos($zN8dist / $distN8Si8) * 180 / 3.14159)]
  set angN9Si9 [expr 90 - (cos($zN9dist / $distN9Si9) * 180 / 3.14159)]
  set angN10Si10 [expr 90 - (cos($zN10dist / $distN10Si10) * 180 / 3.14159)]
  set angN11Si11 [expr 90 - (cos($zN11dist / $distN11Si11) * 180 / 3.14159)]
  set angN12Si12 [expr 90 - (cos($zN12dist / $distN12Si12) * 180 / 3.14159)]

  

  ## Output to .dat file
  puts "\t \t progress: $i/$frames"
  puts $output1 "$i $zN1dist $zN2dist $zN3dist $zN4dist $zN5dist $zN6dist $zN7dist $zN8dist $zN9dist $zN10dist $zN11dist $zN12dist"
  puts $output2 "$i $distN1Si1 $distN2Si2 $distN3Si3 $distN4Si4 $distN5Si5 $distN6Si6 $distN7Si7 $distN8Si8 $distN9Si9 $distN10Si10 $distN11Si11 $distN12Si12"
  puts $output3 "$i $angN1Si1 $angN2Si2 $angN3Si3 $angN4Si4 $angN5Si5 $angN6Si6 $angN7Si7 $angN8Si8 $angN9Si9 $angN10Si10 $angN11Si11 $angN12Si12"
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
