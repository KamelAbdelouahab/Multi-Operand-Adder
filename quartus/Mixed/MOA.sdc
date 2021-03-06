#**************************************************************
# Time Information
#**************************************************************
set_time_format -unit ns -decimal_places 3
#**************************************************************
# Create Clock
#**************************************************************
create_clock -name {clk} -period 20 -waveform { 0 5 } [get_ports {clk}]
#**************************************************************
# Create Generated Clock
#**************************************************************
derive_clocks -period 20
#**************************************************************
# Set Clock Uncertainty
#**************************************************************
derive_clock_uncertainty
#**************************************************************
# Set Input Delay
#**************************************************************
set_input_delay -clock clk -min 0.2 [get_ports {in_data[*]}]
set_input_delay -clock clk -max 0.5 [get_ports {in_data[*]}]
set_input_delay -clock clk -min 0.2 [get_ports {reset_n}]
set_input_delay -clock clk -max 0.5 [get_ports {reset_n}]
set_input_delay -clock clk -min 0.2 [get_ports {enable}]
set_input_delay -clock clk -max 0.5 [get_ports {enable}]
set_input_delay -clock clk -min 0.2 [get_ports {in_valid}]
set_input_delay -clock clk -max 0.5 [get_ports {in_valid}]
#**************************************************************
# Set Output Delay
#**************************************************************
set_output_delay -clock clk -min 0.2 [get_ports {out_data[*]}]
set_output_delay -clock clk -max 0.5 [get_ports {out_data[*]}]
set_output_delay -clock clk -min 0.2 [get_ports {out_valid}]
set_output_delay -clock clk -max 0.5 [get_ports {out_valid}]
