## Wrap unit cell around molecule of interest
package require pbctools
package require hbonds
## Select index of each N and each surface Si bonded to the chain
## For the Si bidentate, list 2 indices, for tridentate list 3
set N1 [atomselect top "index 3148"]
set Si1 [atomselect top "index 683 344 "]
set N2 [atomselect top "index 3168"]
set Si2 [atomselect top "index 6 462"]
set N3 [atomselect top "index 3188"]
set Si3 [atomselect top "index 682 2085"]
set N4 [atomselect top "index 3208"]
set Si4 [atomselect top "index 1865 1987"]
set N5 [atomselect top "index 3228"]
set Si5 [atomselect top "index 1840 1409"]
set N6 [atomselect top "index 3048"]
set Si6 [atomselect top "index 666 49"]
set N7 [atomselect top "index 3068"]
set Si7 [atomselect top "index 89 585"]
set N8 [atomselect top "index 3088"]
set Si8 [atomselect top "index 1729 208"]
set N9 [atomselect top "index 3108"]
set Si9 [atomselect top "index 1747 1817"]
set N10 [atomselect top "index 3128"]
set Si10 [atomselect top "index 1493 1912"]
set N11 [atomselect top "index 2948"]
set Si11 [atomselect top "index 1051 1390"]
set N12 [atomselect top "index 2968"]
set Si12 [atomselect top "index 1168 701"]
set N13 [atomselect top "index 2988"]
set Si13 [atomselect top "index 1197 2437"]
set N14 [atomselect top "index 3008"]
set Si14 [atomselect top "index 1590 2785"]
set N15 [atomselect top "index 3028"]
set Si15 [atomselect top "index 2107 2548"]
set N16 [atomselect top "index 2928"]
set Si16 [atomselect top "index 2196 2697"]
set N17 [atomselect top "index 2908"]
set Si17 [atomselect top "index 2455 2525"]
set N18 [atomselect top "index 2888"]
set Si18 [atomselect top "index 2624 696"]
set N19 [atomselect top "index 2868"]
set Si19 [atomselect top "index 790 1292"]
set N20 [atomselect top "index 2848"]
set Si20 [atomselect top "index 1373 1120"]


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
puts $output1 "##Frame Chain1 Chain2 Chain3 Chain4 Chain5 Chain6 Chain7 Chain8 Chain9 Chain10 Chain11 Chain12 Chain13 Chain14 Chain15 Chain16 Chain17 Chain18 Chain19 Chain20##"
set output2 [open "ChainExtensionLength.dat" w]
puts $output2 "##Frame Chain1 Chain2 Chain3 Chain4 Chain5 Chain6 Chain7 Chain8 Chain9 Chain10 Chain11 Chain12 Chain13 Chain14 Chain15 Chain16 Chain17 Chain18 Chain19 Chain20##"
set output3 [open "ChainAngle.dat" w]
puts $output3 "##Frame Chain1 Chain2 Chain3 Chain4 Chain5 Chain6 Chain7 Chain8 Chain9 Chain10 Chain11 Chain12 Chain13 Chain14 Chain15 Chain16 Chain17 Chain18 Chain19 Chain20##"

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

  set zN13 [lindex [measure center $N13] 2]
  set zSi13 [lindex [measure center $Si13] 2]
  set zN13dist [expr $zN13 - $zSi13]

  set zN14 [lindex [measure center $N14] 2]
  set zSi14 [lindex [measure center $Si14] 2]
  set zN14dist [expr $zN14 - $zSi14]

  set zN15 [lindex [measure center $N15] 2]
  set zSi15 [lindex [measure center $Si15] 2]
  set zN15dist [expr $zN15 - $zSi15]

  set zN16 [lindex [measure center $N16] 2]
  set zSi16 [lindex [measure center $Si16] 2]
  set zN16dist [expr $zN16 - $zSi16]

  set zN17 [lindex [measure center $N17] 2]
  set zSi17 [lindex [measure center $Si17] 2]
  set zN17dist [expr $zN17 - $zSi17]

  set zN18 [lindex [measure center $N18] 2]
  set zSi18 [lindex [measure center $Si18] 2]
  set zN18dist [expr $zN18 - $zSi18]

  set zN19 [lindex [measure center $N19] 2]
  set zSi19 [lindex [measure center $Si19] 2]
  set zN19dist [expr $zN19 - $zSi19]

  set zN20 [lindex [measure center $N20] 2]
  set zSi20 [lindex [measure center $Si20] 2]
  set zN20dist [expr $zN20 - $zSi20]


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
  set xN13 [lindex [measure center $N13] 0]
  set xSi13 [lindex [measure center $Si13] 0]
  set xN14 [lindex [measure center $N14] 0]
  set xSi14 [lindex [measure center $Si14] 0]
  set xN15 [lindex [measure center $N15] 0]
  set xSi15 [lindex [measure center $Si15] 0]
  set xN16 [lindex [measure center $N16] 0]
  set xSi16 [lindex [measure center $Si16] 0]
  set xN17 [lindex [measure center $N17] 0]
  set xSi17 [lindex [measure center $Si17] 0]
  set xN18 [lindex [measure center $N18] 0]
  set xSi18 [lindex [measure center $Si18] 0]
  set xN19 [lindex [measure center $N19] 0]
  set xSi19 [lindex [measure center $Si9] 0]
  set xN20 [lindex [measure center $N20] 0]
  set xSi20 [lindex [measure center $Si20] 0]


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
  set yN13 [lindex [measure center $N13] 1]
  set ySi13 [lindex [measure center $Si13] 1]
  set yN14 [lindex [measure center $N14] 1]
  set ySi14 [lindex [measure center $Si14] 1]
  set yN15 [lindex [measure center $N15] 1]
  set ySi15 [lindex [measure center $Si15] 1]
  set yN16 [lindex [measure center $N16] 1]
  set ySi16 [lindex [measure center $Si16] 1]
  set yN17 [lindex [measure center $N17] 1]
  set ySi17 [lindex [measure center $Si17] 1]
  set yN18 [lindex [measure center $N18] 1]
  set ySi18 [lindex [measure center $Si18] 1]
  set yN19 [lindex [measure center $N19] 1]
  set ySi19 [lindex [measure center $Si19] 1]
  set yN20 [lindex [measure center $N20] 1]
  set ySi20 [lindex [measure center $Si20] 1]


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
  set distN13Si13 [expr sqrt ((($xN13-$xSi13)**2)+(($yN13-$ySi13)**2)+(($zN13-$zSi13)**2))]
  set distN14Si14 [expr sqrt ((($xN14-$xSi14)**2)+(($yN14-$ySi14)**2)+(($zN14-$zSi14)**2))]
  set distN15Si15 [expr sqrt ((($xN15-$xSi15)**2)+(($yN15-$ySi15)**2)+(($zN15-$zSi15)**2))]
  set distN16Si16 [expr sqrt ((($xN16-$xSi16)**2)+(($yN16-$ySi16)**2)+(($zN16-$zSi16)**2))]
  set distN17Si17 [expr sqrt ((($xN17-$xSi17)**2)+(($yN17-$ySi17)**2)+(($zN17-$zSi17)**2))]
  set distN18Si18 [expr sqrt ((($xN18-$xSi18)**2)+(($yN18-$ySi18)**2)+(($zN18-$zSi18)**2))]
  set distN19Si19 [expr sqrt ((($xN19-$xSi19)**2)+(($yN19-$ySi19)**2)+(($zN19-$zSi19)**2))]
  set distN20Si20 [expr sqrt ((($xN20-$xSi20)**2)+(($yN20-$ySi20)**2)+(($zN20-$zSi20)**2))]


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
  set angN13Si13 [expr 90 - (cos($zN13dist / $distN13Si13) * 180 / 3.14159)]
  set angN14Si14 [expr 90 - (cos($zN14dist / $distN14Si14) * 180 / 3.14159)]
  set angN15Si15 [expr 90 - (cos($zN15dist / $distN15Si15) * 180 / 3.14159)]
  set angN16Si16 [expr 90 - (cos($zN16dist / $distN16Si16) * 180 / 3.14159)]
  set angN17Si17 [expr 90 - (cos($zN17dist / $distN17Si17) * 180 / 3.14159)]
  set angN18Si18 [expr 90 - (cos($zN18dist / $distN18Si18) * 180 / 3.14159)]
  set angN19Si19 [expr 90 - (cos($zN19dist / $distN19Si19) * 180 / 3.14159)]
  set angN20Si20 [expr 90 - (cos($zN20dist / $distN20Si20) * 180 / 3.14159)]

  

  ## Output to .dat file
  puts "\t \t progress: $i/$frames"
  puts $output1 "$i $zN1dist $zN2dist $zN3dist $zN4dist $zN5dist $zN6dist $zN7dist $zN8dist $zN9dist $zN10dist $zN11dist $zN12dist $zN13dist $zN14dist $zN15dist $zN16dist $zN17dist $zN18dist $zN19dist $zN20dist"
  puts $output2 "$i $distN1Si1 $distN2Si2 $distN3Si3 $distN4Si4 $distN5Si5 $distN6Si6 $distN7Si7 $distN8Si8 $distN9Si9 $distN10Si10 $distN11Si11 $distN12Si12 $distN13Si13 $distN14Si14 $distN15Si15 $distN16Si16 $distN17Si17 $distN18Si18 $distN19Si19 $distN20Si20"
  puts $output3 "$i $angN1Si1 $angN2Si2 $angN3Si3 $angN4Si4 $angN5Si5 $angN6Si6 $angN7Si7 $angN8Si8 $angN9Si9 $angN10Si10 $angN11Si11 $angN12Si12 $angN13Si13 $angN14Si14 $angN15Si15 $angN16Si16 $angN17Si17 $angN18Si18 $angN19Si19 $angN20Si20"
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
