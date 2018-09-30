#!/usr/bin/tclsh
proc c {} {
  set path_to_projectfiles ../../src
  vlib work
  vmap work work
  vcom -93 -work work $path_to_projectfiles/DataTypes.vhd
  vcom -93 -work work $path_to_projectfiles/Pipeline/SOA.vhd
  vcom -93 -work work $path_to_projectfiles/Pipeline/MOAStage.vhd
  vcom -93 -work work $path_to_projectfiles/Pipeline/MOA.vhd
  vcom -93 -work work MOA_tb.vhd
}

proc s {} {
  vsim -novopt -t 1ps -L altera_mf  -L cyclonev work.MOA_tb
  source auto_wave.tcl
  run 100 ns
}


proc Q  {} {
 quit -force
}

#-----------------------------------------------------------------------------
# proc: mnu
#
# Display help menu
#-----------------------------------------------------------------------------

proc mnu {} {
	puts "------------"
	puts "Command list"
	puts "------------"
	puts " c     launch hdl compilation"
	puts " s     launch simulation"
}
