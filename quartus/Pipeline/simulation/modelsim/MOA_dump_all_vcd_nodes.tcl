# Copyright (C) 2018  Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License 
# Subscription Agreement, the Intel Quartus Prime License Agreement,
# the Intel FPGA IP License Agreement, or other applicable license
# agreement, including, without limitation, that your use is for
# the sole purpose of programming logic devices manufactured by
# Intel and sold by Intel or its authorized distributors.  Please
# refer to the applicable agreement for further details.


# ***************************************************************************
# ***************************************************************************
# 
# File:		/home/kamel/dev/Multi-Operand-Adder/quartus/Pipeline/simulation/modelsim/MOA_dump_all_vcd_nodes.tcl
# 
# Description:	Script for ModelSim-Altera (Verilog) VCD File Dumping
# 		This script is used to direct ModelSim-Altera (Verilog) to dump
# 		all non-combinational nodes in the design to a VCD output file
# 
# Usages:	/home/kamel/dev/Multi-Operand-Adder/quartus/Pipeline/simulation/modelsim/MOA_dump_all_vcd_nodes.tcl
# 
# Generated by:	Quartus Prime
# 		Version 18.0.0 Build 614 04/24/2018 SJ Standard Edition
# 
# Date:		Fri Sep 28 17:40:27 2018
# 
# Design:	MOA
# 
# ***************************************************************************
# ***************************************************************************

# ----------------------------------------------------------------
#
proc add_vcd_signals { hierarchy vcd_filename } {
#
# Description:	This function directs ModelSim-Altera (Verilog) to print out the
#		appropriate VCD signals, with the hierarchy level
#		prepended to each signal name
#
# ----------------------------------------------------------------

   catch { vcd add "$hierarchy/pip_acc_a9_a_a0_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a9_a_a1_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a9_a_a2_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a9_a_a3_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a9_a_a4_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a9_a_a5_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a9_a_a6_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a9_a_a7_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a9_a_a8_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a9_a_a9_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a9_a_a10_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a9_a_a11_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a8_a_a0_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a8_a_a1_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a8_a_a2_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a8_a_a3_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a8_a_a4_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a8_a_a5_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a8_a_a6_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a8_a_a7_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a8_a_a8_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a8_a_a9_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a8_a_a10_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a8_a_a11_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a7_a_a0_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a7_a_a1_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a7_a_a2_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a7_a_a3_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a7_a_a4_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a7_a_a5_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a7_a_a6_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a7_a_a7_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a7_a_a8_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a7_a_a9_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a7_a_a10_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a7_a_a11_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a6_a_a0_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a6_a_a1_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a6_a_a2_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a6_a_a3_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a6_a_a4_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a6_a_a5_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a6_a_a6_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a6_a_a7_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a6_a_a8_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a6_a_a9_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a6_a_a10_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a6_a_a11_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a5_a_a0_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a5_a_a1_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a5_a_a2_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a5_a_a3_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a5_a_a4_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a5_a_a5_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a5_a_a6_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a5_a_a7_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a5_a_a8_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a5_a_a9_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a5_a_a10_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a5_a_a11_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a4_a_a0_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a4_a_a1_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a4_a_a2_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a4_a_a3_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a4_a_a4_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a4_a_a5_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a4_a_a6_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a4_a_a7_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a4_a_a8_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a4_a_a9_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a4_a_a10_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a4_a_a11_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a3_a_a0_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a3_a_a1_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a3_a_a2_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a3_a_a3_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a3_a_a4_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a3_a_a5_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a3_a_a6_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a3_a_a7_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a3_a_a8_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a3_a_a9_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a3_a_a10_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a3_a_a11_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a2_a_a0_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a2_a_a1_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a2_a_a2_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a2_a_a3_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a2_a_a4_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a2_a_a5_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a2_a_a6_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a2_a_a7_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a2_a_a8_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a2_a_a9_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a1_a_a0_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a1_a_a1_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a1_a_a2_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a1_a_a3_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a1_a_a4_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a1_a_a5_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a1_a_a6_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a1_a_a7_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a1_a_a8_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a1_a_a10_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a0_a_a0_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a0_a_a1_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a0_a_a2_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a0_a_a3_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a0_a_a4_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a0_a_a5_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a0_a_a6_a_aq" }
   catch { vcd add "$hierarchy/pip_acc_a0_a_a7_a_aq" }
   catch { vcd add "$hierarchy/out_data_a0_a_areg0_q" }
   catch { vcd add "$hierarchy/out_data_a1_a_areg0_q" }
   catch { vcd add "$hierarchy/out_data_a2_a_areg0_q" }
   catch { vcd add "$hierarchy/out_data_a3_a_areg0_q" }
   catch { vcd add "$hierarchy/out_data_a4_a_areg0_q" }
   catch { vcd add "$hierarchy/out_data_a5_a_areg0_q" }
   catch { vcd add "$hierarchy/out_data_a6_a_areg0_q" }
   catch { vcd add "$hierarchy/out_data_a7_a_areg0_q" }
   catch { vcd add "$hierarchy/out_data_a8_a_areg0_q" }
   catch { vcd add "$hierarchy/out_data_a9_a_areg0_q" }
   catch { vcd add "$hierarchy/out_data_a10_a_areg0_q" }
   catch { vcd add "$hierarchy/out_data_a11_a_areg0_q" }
   catch { vcd add "$hierarchy/out_valid_areg0_q" }
   catch { vcd add "$hierarchy/pip_acc_a2_a_a10_a_aq" }
   catch { vcd add "$hierarchy/out_data\[0\]" }
   catch { vcd add "$hierarchy/out_data\[0\]" }
   catch { vcd add "$hierarchy/out_data\[1\]" }
   catch { vcd add "$hierarchy/out_data\[1\]" }
   catch { vcd add "$hierarchy/out_data\[2\]" }
   catch { vcd add "$hierarchy/out_data\[2\]" }
   catch { vcd add "$hierarchy/out_data\[3\]" }
   catch { vcd add "$hierarchy/out_data\[3\]" }
   catch { vcd add "$hierarchy/out_data\[4\]" }
   catch { vcd add "$hierarchy/out_data\[4\]" }
   catch { vcd add "$hierarchy/out_data\[5\]" }
   catch { vcd add "$hierarchy/out_data\[5\]" }
   catch { vcd add "$hierarchy/out_data\[6\]" }
   catch { vcd add "$hierarchy/out_data\[6\]" }
   catch { vcd add "$hierarchy/out_data\[7\]" }
   catch { vcd add "$hierarchy/out_data\[7\]" }
   catch { vcd add "$hierarchy/out_data\[8\]" }
   catch { vcd add "$hierarchy/out_data\[8\]" }
   catch { vcd add "$hierarchy/out_data\[9\]" }
   catch { vcd add "$hierarchy/out_data\[9\]" }
   catch { vcd add "$hierarchy/out_data\[10\]" }
   catch { vcd add "$hierarchy/out_data\[10\]" }
   catch { vcd add "$hierarchy/out_data\[11\]" }
   catch { vcd add "$hierarchy/out_data\[11\]" }
   catch { vcd add "$hierarchy/out_valid" }
   catch { vcd add "$hierarchy/out_valid" }
   catch { vcd add "$hierarchy/clk_ainput_o" }
   catch { vcd add "$hierarchy/clk" }
   catch { vcd add "$hierarchy/reset_n_ainput_o" }
   catch { vcd add "$hierarchy/reset_n" }
   catch { vcd add "$hierarchy/enable_ainput_o" }
   catch { vcd add "$hierarchy/enable" }
   catch { vcd add "$hierarchy/in_valid_ainput_o" }
   catch { vcd add "$hierarchy/in_valid" }
   catch { vcd add "$hierarchy/in_data_a9_a_a0_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_9_0" }
   catch { vcd add "$hierarchy/in_data_a9_a_a1_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_9_1" }
   catch { vcd add "$hierarchy/in_data_a9_a_a2_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_9_2" }
   catch { vcd add "$hierarchy/in_data_a9_a_a3_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_9_3" }
   catch { vcd add "$hierarchy/in_data_a9_a_a4_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_9_4" }
   catch { vcd add "$hierarchy/in_data_a9_a_a5_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_9_5" }
   catch { vcd add "$hierarchy/in_data_a9_a_a6_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_9_6" }
   catch { vcd add "$hierarchy/in_data_a9_a_a7_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_9_7" }
   catch { vcd add "$hierarchy/in_data_a8_a_a0_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_8_0" }
   catch { vcd add "$hierarchy/in_data_a8_a_a1_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_8_1" }
   catch { vcd add "$hierarchy/in_data_a8_a_a2_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_8_2" }
   catch { vcd add "$hierarchy/in_data_a8_a_a3_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_8_3" }
   catch { vcd add "$hierarchy/in_data_a8_a_a4_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_8_4" }
   catch { vcd add "$hierarchy/in_data_a8_a_a5_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_8_5" }
   catch { vcd add "$hierarchy/in_data_a8_a_a6_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_8_6" }
   catch { vcd add "$hierarchy/in_data_a8_a_a7_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_8_7" }
   catch { vcd add "$hierarchy/in_data_a7_a_a0_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_7_0" }
   catch { vcd add "$hierarchy/in_data_a7_a_a1_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_7_1" }
   catch { vcd add "$hierarchy/in_data_a7_a_a2_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_7_2" }
   catch { vcd add "$hierarchy/in_data_a7_a_a3_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_7_3" }
   catch { vcd add "$hierarchy/in_data_a7_a_a4_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_7_4" }
   catch { vcd add "$hierarchy/in_data_a7_a_a5_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_7_5" }
   catch { vcd add "$hierarchy/in_data_a7_a_a6_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_7_6" }
   catch { vcd add "$hierarchy/in_data_a7_a_a7_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_7_7" }
   catch { vcd add "$hierarchy/in_data_a6_a_a0_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_6_0" }
   catch { vcd add "$hierarchy/in_data_a6_a_a1_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_6_1" }
   catch { vcd add "$hierarchy/in_data_a6_a_a2_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_6_2" }
   catch { vcd add "$hierarchy/in_data_a6_a_a3_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_6_3" }
   catch { vcd add "$hierarchy/in_data_a6_a_a4_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_6_4" }
   catch { vcd add "$hierarchy/in_data_a6_a_a5_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_6_5" }
   catch { vcd add "$hierarchy/in_data_a6_a_a6_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_6_6" }
   catch { vcd add "$hierarchy/in_data_a6_a_a7_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_6_7" }
   catch { vcd add "$hierarchy/in_data_a5_a_a0_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_5_0" }
   catch { vcd add "$hierarchy/in_data_a5_a_a1_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_5_1" }
   catch { vcd add "$hierarchy/in_data_a5_a_a2_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_5_2" }
   catch { vcd add "$hierarchy/in_data_a5_a_a3_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_5_3" }
   catch { vcd add "$hierarchy/in_data_a5_a_a4_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_5_4" }
   catch { vcd add "$hierarchy/in_data_a5_a_a5_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_5_5" }
   catch { vcd add "$hierarchy/in_data_a5_a_a6_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_5_6" }
   catch { vcd add "$hierarchy/in_data_a5_a_a7_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_5_7" }
   catch { vcd add "$hierarchy/in_data_a4_a_a0_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_4_0" }
   catch { vcd add "$hierarchy/in_data_a4_a_a1_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_4_1" }
   catch { vcd add "$hierarchy/in_data_a4_a_a2_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_4_2" }
   catch { vcd add "$hierarchy/in_data_a4_a_a3_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_4_3" }
   catch { vcd add "$hierarchy/in_data_a4_a_a4_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_4_4" }
   catch { vcd add "$hierarchy/in_data_a4_a_a5_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_4_5" }
   catch { vcd add "$hierarchy/in_data_a4_a_a6_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_4_6" }
   catch { vcd add "$hierarchy/in_data_a4_a_a7_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_4_7" }
   catch { vcd add "$hierarchy/in_data_a3_a_a0_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_3_0" }
   catch { vcd add "$hierarchy/in_data_a3_a_a1_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_3_1" }
   catch { vcd add "$hierarchy/in_data_a3_a_a2_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_3_2" }
   catch { vcd add "$hierarchy/in_data_a3_a_a3_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_3_3" }
   catch { vcd add "$hierarchy/in_data_a3_a_a4_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_3_4" }
   catch { vcd add "$hierarchy/in_data_a3_a_a5_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_3_5" }
   catch { vcd add "$hierarchy/in_data_a3_a_a6_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_3_6" }
   catch { vcd add "$hierarchy/in_data_a3_a_a7_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_3_7" }
   catch { vcd add "$hierarchy/in_data_a2_a_a0_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_2_0" }
   catch { vcd add "$hierarchy/in_data_a2_a_a1_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_2_1" }
   catch { vcd add "$hierarchy/in_data_a2_a_a2_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_2_2" }
   catch { vcd add "$hierarchy/in_data_a2_a_a3_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_2_3" }
   catch { vcd add "$hierarchy/in_data_a2_a_a4_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_2_4" }
   catch { vcd add "$hierarchy/in_data_a2_a_a5_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_2_5" }
   catch { vcd add "$hierarchy/in_data_a2_a_a6_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_2_6" }
   catch { vcd add "$hierarchy/in_data_a2_a_a7_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_2_7" }
   catch { vcd add "$hierarchy/in_data_a1_a_a0_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_1_0" }
   catch { vcd add "$hierarchy/in_data_a1_a_a1_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_1_1" }
   catch { vcd add "$hierarchy/in_data_a1_a_a2_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_1_2" }
   catch { vcd add "$hierarchy/in_data_a1_a_a3_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_1_3" }
   catch { vcd add "$hierarchy/in_data_a1_a_a4_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_1_4" }
   catch { vcd add "$hierarchy/in_data_a1_a_a5_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_1_5" }
   catch { vcd add "$hierarchy/in_data_a1_a_a6_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_1_6" }
   catch { vcd add "$hierarchy/in_data_a1_a_a7_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_1_7" }
   catch { vcd add "$hierarchy/in_data_a0_a_a0_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_0_0" }
   catch { vcd add "$hierarchy/in_data_a0_a_a1_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_0_1" }
   catch { vcd add "$hierarchy/in_data_a0_a_a2_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_0_2" }
   catch { vcd add "$hierarchy/in_data_a0_a_a3_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_0_3" }
   catch { vcd add "$hierarchy/in_data_a0_a_a4_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_0_4" }
   catch { vcd add "$hierarchy/in_data_a0_a_a5_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_0_5" }
   catch { vcd add "$hierarchy/in_data_a0_a_a6_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_0_6" }
   catch { vcd add "$hierarchy/in_data_a0_a_a7_a_ainput_o" }
   catch { vcd add "$hierarchy/in_data_0_7" }
   catch { vcd add "$hierarchy/clk_ainputCLKENA0_outclk" }
}

# ----------------------------------------------------------------
#
proc main { argv } {
#
# Description:	Main entry point to script.  Iterate over all
#		hierarchy levels specified, and direct ModelSim-Altera (Verilog)
#		to print the relevant signals under each level
#
# ----------------------------------------------------------------

   set vcd_filename "MOA.vcd"
   set hierarchy "MOA"

   vcd file "$vcd_filename"
   vcd on

   add_vcd_signals $hierarchy $vcd_filename
}

main $argv