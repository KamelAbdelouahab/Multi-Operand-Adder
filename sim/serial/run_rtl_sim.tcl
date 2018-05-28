#!/usr/bin/tclsh

proc c_lib {} {
  set path_to_quartus /home/kamel/intelFPGA/17.1/quartus

  vlib altera_mf
  vmap altera_mf altera_mf
  vcom -work altera_mf -2002 -explicit $path_to_quartus/eda/sim_lib/altera_mf_components.vhd
  vcom -work altera_mf  $path_to_quartus/eda/sim_lib/altera_mf.vhd
}

proc c {} {

  set path_to_projectfiles ../../src

  vlib work
  vmap work work

  vcom -93 -work work $path_to_projectfiles/DataTypes.vhd
  vcom -93 -work work $path_to_projectfiles/serial/Accumulator.vhd
  vcom -93 -work work $path_to_projectfiles/serial/Serializer.vhd
  vcom -93 -work work $path_to_projectfiles/serial/SerialMOA.vhd
  vcom -93 -work work SerialMOA_tb.vhd

}

proc s {} {
  vsim -novopt -t 1ps -L altera_mf  -L cyclonev work.SerialMOA_tb

  source auto_wave.tcl
  run 1500 ns

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
	puts ""
	puts " mnu   display this menu"
	puts " c_lib launch libraries compilation"
	puts " c     launch hdl compilation"
	puts " s     launch simulation"
	puts " cs    launch compil and simulation"
}
