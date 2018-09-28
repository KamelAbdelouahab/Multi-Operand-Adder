transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/kamel/dev/Multi-Operand-Adder/src/DataTypes.vhd}
vcom -93 -work work {/home/kamel/dev/Multi-Operand-Adder/src/Pipeline/MOA.vhd}

do "/home/kamel/dev/Multi-Operand-Adder/quartus/Pipeline/../../sim/Pipeline/rtl_sim.tcl"
