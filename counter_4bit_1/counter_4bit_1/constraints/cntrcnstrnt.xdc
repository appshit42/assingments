## 100 MHz clock
set_property PACKAGE_PIN E3 [get_ports clk_100MHz]
set_property IOSTANDARD LVCMOS33 [get_ports clk_100MHz]
create_clock -period 10.000 -name clk_100MHz [get_ports clk_100MHz]


## Reset - CPU RESET button
set_property PACKAGE_PIN C12 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]


## Direction - Switch SW0
set_property PACKAGE_PIN J15 [get_ports direction]
set_property IOSTANDARD LVCMOS33 [get_ports direction]


## Counter outputs - LEDs LD0 to LD3
set_property PACKAGE_PIN H17 [get_ports {count_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {count_out[0]}]

set_property PACKAGE_PIN K15 [get_ports {count_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {count_out[1]}]

set_property PACKAGE_PIN J13 [get_ports {count_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {count_out[2]}]

set_property PACKAGE_PIN N14 [get_ports {count_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {count_out[3]}]


## Mode LED - LD4
set_property PACKAGE_PIN R18 [get_ports mode_led]
set_property IOSTANDARD LVCMOS33 [get_ports mode_led]