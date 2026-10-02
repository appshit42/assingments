
## =========================================================
## NEXYS A7-100T
## Plaintext: SW0-SW15
## Ciphertext: LED0-LED15
## =========================================================


## =========================================================
## CLOCK - 100 MHz
## =========================================================

set_property PACKAGE_PIN E3 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

create_clock -period 10.000 -name sys_clk [get_ports clk]


## =========================================================
## RESET - BTNC
## =========================================================

set_property PACKAGE_PIN N17 [get_ports rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports rst_n]


## =========================================================
## START - BTNU
## =========================================================

set_property PACKAGE_PIN M18 [get_ports start]
set_property IOSTANDARD LVCMOS33 [get_ports start]


## =========================================================
## PLAINTEXT INPUT - SW0 to SW15
## =========================================================

set_property PACKAGE_PIN J15 [get_ports {plaintext[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {plaintext[0]}]

set_property PACKAGE_PIN L16 [get_ports {plaintext[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {plaintext[1]}]

set_property PACKAGE_PIN M13 [get_ports {plaintext[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {plaintext[2]}]

set_property PACKAGE_PIN R15 [get_ports {plaintext[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {plaintext[3]}]

set_property PACKAGE_PIN R17 [get_ports {plaintext[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {plaintext[4]}]

set_property PACKAGE_PIN T18 [get_ports {plaintext[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {plaintext[5]}]

set_property PACKAGE_PIN U18 [get_ports {plaintext[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {plaintext[6]}]

set_property PACKAGE_PIN R13 [get_ports {plaintext[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {plaintext[7]}]

set_property PACKAGE_PIN T8 [get_ports {plaintext[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {plaintext[8]}]

set_property PACKAGE_PIN U8 [get_ports {plaintext[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {plaintext[9]}]

set_property PACKAGE_PIN R16 [get_ports {plaintext[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {plaintext[10]}]

set_property PACKAGE_PIN T13 [get_ports {plaintext[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {plaintext[11]}]

set_property PACKAGE_PIN H6 [get_ports {plaintext[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {plaintext[12]}]

set_property PACKAGE_PIN U12 [get_ports {plaintext[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {plaintext[13]}]

set_property PACKAGE_PIN U11 [get_ports {plaintext[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {plaintext[14]}]

set_property PACKAGE_PIN V10 [get_ports {plaintext[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {plaintext[15]}]


## =========================================================
## CIPHERTEXT OUTPUT - LED0 to LED15
## =========================================================

set_property PACKAGE_PIN H17 [get_ports {ciphertext[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ciphertext[0]}]

set_property PACKAGE_PIN K15 [get_ports {ciphertext[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ciphertext[1]}]

set_property PACKAGE_PIN J13 [get_ports {ciphertext[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ciphertext[2]}]

set_property PACKAGE_PIN N14 [get_ports {ciphertext[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ciphertext[3]}]

set_property PACKAGE_PIN R18 [get_ports {ciphertext[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ciphertext[4]}]

set_property PACKAGE_PIN V17 [get_ports {ciphertext[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ciphertext[5]}]

set_property PACKAGE_PIN U17 [get_ports {ciphertext[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ciphertext[6]}]

set_property PACKAGE_PIN U16 [get_ports {ciphertext[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ciphertext[7]}]

set_property PACKAGE_PIN V16 [get_ports {ciphertext[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ciphertext[8]}]

set_property PACKAGE_PIN T15 [get_ports {ciphertext[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ciphertext[9]}]

set_property PACKAGE_PIN U14 [get_ports {ciphertext[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ciphertext[10]}]

set_property PACKAGE_PIN T16 [get_ports {ciphertext[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ciphertext[11]}]

set_property PACKAGE_PIN V15 [get_ports {ciphertext[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ciphertext[12]}]

set_property PACKAGE_PIN V14 [get_ports {ciphertext[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ciphertext[13]}]

set_property PACKAGE_PIN V12 [get_ports {ciphertext[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ciphertext[14]}]

set_property PACKAGE_PIN V11 [get_ports {ciphertext[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ciphertext[15]}]

