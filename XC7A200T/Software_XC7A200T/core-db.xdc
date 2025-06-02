##
## Full constraints.xdc for Core Board + DB-FPGA peripherals + U2/U4 Headers
##
## Includes:
##   A) LEDs & Button
##   B) sys_clk & prog_b
##   C) DDR3 SDRAM
##   D) Quad-SPI Flash
##   E) Ethernet PHY (RTL8211EG)
##   F) Micro SD Card
##   G) VGA
##   H) RP2040 GPIOs (true GPIO, BOOT, LED)
##   I) RP2040 JTAG & SWD (choose one)
##   J) RP2040 ADC (choose if needed)
##   M) U2 & U4 2×32 Header Constraints (prefixed with u2_/u4_)
##
## NOTES:
## 1. All I/O standards are LVCMOS33 unless otherwise noted (DDR3 uses SSTL15/DIFF_SSTL15).
## 2. Header‐pins 1,2,5,6,61,62 on J2/J3 = GND (omitted), pins 3,4 = VCCO (3.3 V, omitted), pins 63,64 = VIN (omitted).
## 3. JTAG (GPIO16–GPIO19) vs SWD (SWCLK/SWDIO) share physical pins—uncomment only one interface in section I.
## 4. ADC pins (GPIO26–GPIO29) share package pins with some JTAG/SWD/GPIO20–GPIO23—uncomment only if no conflict.
## 5. DDR3 signals are in Bank16 (1.5 V); all other I/Os are in 3.3 V banks.
##

###############################################################################
## A) LEDs & Button (Core Board, Bank 33, LVCMOS33)
###############################################################################

# led_red   → R23
set_property PACKAGE_PIN R23 [get_ports {led_red}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_red}]

# led_green → T23
set_property PACKAGE_PIN T23 [get_ports {led_green}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_green}]

# led_blue  → T22
set_property PACKAGE_PIN T22 [get_ports {led_blue}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_blue}]

# btn_center → P4
set_property PACKAGE_PIN P4 [get_ports {btn_center}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn_center}]
set_property PULLUP true [get_ports {btn_center}]


###############################################################################
## B) sys_clk & prog_b (Core Board, Bank 33, LVCMOS33)
###############################################################################

# sys_clk → H17 (50 MHz input)
set_property PACKAGE_PIN H17 [get_ports {sys_clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {sys_clk}]

# prog_b → AE16 (active‐low PROGRAM_B)
set_property PACKAGE_PIN AE16 [get_ports {prog_b}]
set_property IOSTANDARD LVCMOS33 [get_ports {prog_b}]


###############################################################################
## C) DDR3 SDRAM (Core Board, Bank 16, SSTL15/DIFF_SSTL15)
###############################################################################

## Address A[0..13]
set_property PACKAGE_PIN N3  [get_ports {ddr_a[0]}]   set_property IOSTANDARD SSTL15      [get_ports {ddr_a[0]}]
set_property PACKAGE_PIN P7  [get_ports {ddr_a[1]}]   set_property IOSTANDARD SSTL15      [get_ports {ddr_a[1]}]
set_property PACKAGE_PIN P3  [get_ports {ddr_a[2]}]   set_property IOSTANDARD SSTL15      [get_ports {ddr_a[2]}]
set_property PACKAGE_PIN N2  [get_ports {ddr_a[3]}]   set_property IOSTANDARD SSTL15      [get_ports {ddr_a[3]}]
set_property PACKAGE_PIN P8  [get_ports {ddr_a[4]}]   set_property IOSTANDARD SSTL15      [get_ports {ddr_a[4]}]
set_property PACKAGE_PIN P2  [get_ports {ddr_a[5]}]   set_property IOSTANDARD SSTL15      [get_ports {ddr_a[5]}]
set_property PACKAGE_PIN R8  [get_ports {ddr_a[6]}]   set_property IOSTANDARD SSTL15      [get_ports {ddr_a[6]}]
set_property PACKAGE_PIN R2  [get_ports {ddr_a[7]}]   set_property IOSTANDARD SSTL15      [get_ports {ddr_a[7]}]
set_property PACKAGE_PIN T8  [get_ports {ddr_a[8]}]   set_property IOSTANDARD SSTL15      [get_ports {ddr_a[8]}]
set_property PACKAGE_PIN R3  [get_ports {ddr_a[9]}]   set_property IOSTANDARD SSTL15      [get_ports {ddr_a[9]}]
set_property PACKAGE_PIN R7  [get_ports {ddr_a[10]}]  set_property IOSTANDARD SSTL15      [get_ports {ddr_a[10]}]
set_property PACKAGE_PIN N7  [get_ports {ddr_a[11]}]  set_property IOSTANDARD SSTL15      [get_ports {ddr_a[11]}]
set_property PACKAGE_PIN T3  [get_ports {ddr_a[12]}]  set_property IOSTANDARD SSTL15      [get_ports {ddr_a[12]}]
set_property PACKAGE_PIN T7  [get_ports {ddr_a[13]}]  set_property IOSTANDARD SSTL15      [get_ports {ddr_a[13]}]

## Bank Address BA[0..2]
set_property PACKAGE_PIN M2  [get_ports {ddr_ba[0]}]  set_property IOSTANDARD SSTL15      [get_ports {ddr_ba[0]}]
set_property PACKAGE_PIN N8  [get_ports {ddr_ba[1]}]  set_property IOSTANDARD SSTL15      [get_ports {ddr_ba[1]}]
set_property PACKAGE_PIN M3  [get_ports {ddr_ba[2]}]  set_property IOSTANDARD SSTL15      [get_ports {ddr_ba[2]}]

## Control: CKE, CS_N, RAS_N, CAS_N, WE_N, ODT
set_property PACKAGE_PIN L2  [get_ports {ddr_cke}]     set_property IOSTANDARD SSTL15      [get_ports {ddr_cke}]
set_property PACKAGE_PIN N16 [get_ports {ddr_cs_n}]    set_property IOSTANDARD SSTL15      [get_ports {ddr_cs_n}]
set_property PACKAGE_PIN L3  [get_ports {ddr_ras_n}]   set_property IOSTANDARD SSTL15      [get_ports {ddr_ras_n}]
set_property PACKAGE_PIN K3  [get_ports {ddr_cas_n}]   set_property IOSTANDARD SSTL15      [get_ports {ddr_cas_n}]
set_property PACKAGE_PIN J3  [get_ports {ddr_we_n}]    set_property IOSTANDARD SSTL15      [get_ports {ddr_we_n}]
set_property PACKAGE_PIN L4  [get_ports {ddr_odt}]     set_property IOSTANDARD SSTL15      [get_ports {ddr_odt}]

## Differential Clock CK_P / CK_N
set_property PACKAGE_PIN T4  [get_ports {ddr_ck_p}]    set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr_ck_p}]
set_property PACKAGE_PIN T3  [get_ports {ddr_ck_n}]    set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr_ck_n}]

## Reset (active-low)
set_property PACKAGE_PIN N19 [get_ports {ddr_reset_n}] set_property IOSTANDARD SSTL15      [get_ports {ddr_reset_n}]

## Data DQ[0..15]
set_property PACKAGE_PIN E3  [get_ports {ddr_dq[0]}]   set_property IOSTANDARD SSTL15      [get_ports {ddr_dq[0]}]
set_property PACKAGE_PIN F7  [get_ports {ddr_dq[1]}]   set_property IOSTANDARD SSTL15      [get_ports {ddr_dq[1]}]
set_property PACKAGE_PIN F2  [get_ports {ddr_dq[2]}]   set_property IOSTANDARD SSTL15      [get_ports {ddr_dq[2]}]
set_property PACKAGE_PIN F8  [get_ports {ddr_dq[3]}]   set_property IOSTANDARD SSTL15      [get_ports {ddr_dq[3]}]
set_property PACKAGE_PIN H3  [get_ports {ddr_dq[4]}]   set_property IOSTANDARD SSTL15      [get_ports {ddr_dq[4]}]
set_property PACKAGE_PIN H8  [get_ports {ddr_dq[5]}]   set_property IOSTANDARD SSTL15      [get_ports {ddr_dq[5]}]
set_property PACKAGE_PIN G2  [get_ports {ddr_dq[6]}]   set_property IOSTANDARD SSTL15      [get_ports {ddr_dq[6]}]
set_property PACKAGE_PIN H7  [get_ports {ddr_dq[7]}]   set_property IOSTANDARD SSTL15      [get_ports {ddr_dq[7]}]
set_property PACKAGE_PIN C2  [get_ports {ddr_dq[8]}]   set_property IOSTANDARD SSTL15      [get_ports {ddr_dq[8]}]
set_property PACKAGE_PIN D7  [get_ports {ddr_dq[9]}]   set_property IOSTANDARD SSTL15      [get_ports {ddr_dq[9]}]
set_property PACKAGE_PIN D9  [get_ports {ddr_dq[10]}]  set_property IOSTANDARD SSTL15      [get_ports {ddr_dq[10]}]
set_property PACKAGE_PIN D8  [get_ports {ddr_dq[11]}]  set_property IOSTANDARD SSTL15      [get_ports {ddr_dq[11]}]
set_property PACKAGE_PIN B18 [get_ports {ddr_dq[12]}]  set_property IOSTANDARD SSTL15      [get_ports {ddr_dq[12]}]
set_property PACKAGE_PIN G1  [get_ports {ddr_dq[13]}]  set_property IOSTANDARD SSTL15      [get_ports {ddr_dq[13]}]
set_property PACKAGE_PIN B19 [get_ports {ddr_dq[14]}]  set_property IOSTANDARD SSTL15      [get_ports {ddr_dq[14]}]
set_property PACKAGE_PIN E1  [get_ports {ddr_dq[15]}]  set_property IOSTANDARD SSTL15      [get_ports {ddr_dq[15]}]

## Data Strobe DQS (diff)
set_property PACKAGE_PIN B20 [get_ports {ddr_dqs_p[0]}] set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr_dqs_p[0]}]
set_property PACKAGE_PIN B21 [get_ports {ddr_dqs_n[0]}] set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr_dqs_n[0]}]
set_property PACKAGE_PIN C24 [get_ports {ddr_dqs_p[1]}] set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr_dqs_p[1]}]
set_property PACKAGE_PIN B24 [get_ports {ddr_dqs_n[1]}] set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr_dqs_n[1]}]

## Data Mask DM[0..1]
set_property PACKAGE_PIN M1  [get_ports {ddr_dm[0]}]   set_property IOSTANDARD SSTL15      [get_ports {ddr_dm[0]}]
set_property PACKAGE_PIN A5  [get_ports {ddr_dm[1]}]   set_property IOSTANDARD SSTL15      [get_ports {ddr_dm[1]}]

## VREF
set_property PACKAGE_PIN C23 [get_ports {ddr_vref}]    set_property IOSTANDARD SSTL15      [get_ports {ddr_vref}]


###############################################################################
## D) Quad-SPI Flash (Core Board, Bank 14, LVCMOS33)
###############################################################################

# flash_io0 (MOSI) → R14  (IO_L1P_T0_D00_MOSI_14)
set_property PACKAGE_PIN R14 [get_ports {flash_io0}]
set_property IOSTANDARD LVCMOS33 [get_ports {flash_io0}]
set_property PULLUP true  [get_ports {flash_io0}]

# flash_io1 (MISO) → R15  (IO_L1N_T0_D01_DIN_14)
set_property PACKAGE_PIN R15 [get_ports {flash_io1}]
set_property IOSTANDARD LVCMOS33 [get_ports {flash_io1}]
set_property PULLUP true  [get_ports {flash_io1}]

# flash_io2       → P14  (IO_L2P_T0_D02_14)
set_property PACKAGE_PIN P14 [get_ports {flash_io2}]
set_property IOSTANDARD LVCMOS33 [get_ports {flash_io2}]
set_property PULLUP true  [get_ports {flash_io2}]

# flash_io3       → N14  (IO_L2N_T0_D03_14)
set_property PACKAGE_PIN N14 [get_ports {flash_io3}]
set_property IOSTANDARD LVCMOS33 [get_ports {flash_io3}]
set_property PULLUP true  [get_ports {flash_io3}]

# flash_cs_n      → P18  (IO_L6P_T0_FCS_B_14)
set_property PACKAGE_PIN P18 [get_ports {flash_cs_n}]
set_property IOSTANDARD LVCMOS33 [get_ports {flash_cs_n}]
set_property PULLUP true  [get_ports {flash_cs_n}]

# fpga_cclk       → H13  (CCLK_0, to be driven by STARTUPE2)
set_property PACKAGE_PIN H13 [get_ports {fpga_cclk}]
set_property IOSTANDARD LVCMOS33 [get_ports {fpga_cclk}]
set_property PULLUP true  [get_ports {fpga_cclk}]


###############################################################################
## E) Ethernet PHY (RTL8211EG) via J2_IOxx → U2 (Bank 13/15, LVCMOS33)
###############################################################################

## RGMII Transmit
# eth_txd0 → J2_IO46 → Y23   (Bank 13)
set_property PACKAGE_PIN Y23 [get_ports {eth_txd0}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_txd0}]

# eth_txd1 → J2_IO48 → Y22   (Bank 13)
set_property PACKAGE_PIN Y22 [get_ports {eth_txd1}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_txd1}]

# eth_txd2 → J2_IO50 → AA25  (Bank 13)
set_property PACKAGE_PIN AA25 [get_ports {eth_txd2}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_txd2}]

# eth_txd3 → J2_IO52 → Y25   (Bank 13)
set_property PACKAGE_PIN Y25 [get_ports {eth_txd3}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_txd3}]

# eth_tx_en → J2_IO54 → AC24  (Bank 13)
set_property PACKAGE_PIN AC24 [get_ports {eth_tx_en}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_tx_en}]

# eth_tx_clk → J2_IO56 → AB24 (Bank 13)
set_property PACKAGE_PIN AB24 [get_ports {eth_tx_clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_tx_clk}]

# eth_tx_er (optional) → J2_IO58 → W21 (Bank 13)
#set_property PACKAGE_PIN W21 [get_ports {eth_tx_er}]
#set_property IOSTANDARD LVCMOS33 [get_ports {eth_tx_er}]

## RGMII Receive
# eth_rxd0 → J2_IO45 → V21  (Bank 13)
set_property PACKAGE_PIN V21 [get_ports {eth_rxd0}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_rxd0}]

# eth_rxd1 → J2_IO47 → U21  (Bank 13)
set_property PACKAGE_PIN U21 [get_ports {eth_rxd1}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_rxd1}]

# eth_rxd2 → J2_IO49 → V23  (Bank 13)
set_property PACKAGE_PIN V23 [get_ports {eth_rxd2}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_rxd2}]

# eth_rxd3 → J2_IO51 → W23  (Bank 13)
set_property PACKAGE_PIN W23 [get_ports {eth_rxd3}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_rxd3}]

# eth_rx_dv → J2_IO53 → Y23  (Bank 13)
set_property PACKAGE_PIN Y23 [get_ports {eth_rx_dv}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_rx_dv}]

# eth_rx_clk → J2_IO55 → Y22 (Bank 13)
set_property PACKAGE_PIN Y22 [get_ports {eth_rx_clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_rx_clk}]

# eth_rx_er (optional) → J2_IO57 → AA25 (Bank 13)
#set_property PACKAGE_PIN AA25 [get_ports {eth_rx_er}]
#set_property IOSTANDARD LVCMOS33 [get_ports {eth_rx_er}]

## MDIO / MDC
# eth_mdio → J2_IO54 → Y26  (Bank 13)
set_property PACKAGE_PIN Y26 [get_ports {eth_mdio}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_mdio}]

# eth_mdc  → J2_IO53 → W25  (Bank 13)
set_property PACKAGE_PIN W25 [get_ports {eth_mdc}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_mdc}]

## PHY LEDs
# eth_led0 → J2_IO50 → W25   (Bank 13)
set_property PACKAGE_PIN W25 [get_ports {eth_led0}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_led0}]

# eth_led1 → J2_IO51 → AC26  (Bank 13)
set_property PACKAGE_PIN AC26 [get_ports {eth_led1}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_led1}]

# eth_led2 → J2_IO52 → AB26  (Bank 13)
set_property PACKAGE_PIN AB26 [get_ports {eth_led2}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_led2}]

## Collision / Carrier Sense (optional)
# eth_col → J2_IO40 → W21  (Bank 13)
#set_property PACKAGE_PIN W21 [get_ports {eth_col}]
#set_property IOSTANDARD LVCMOS33 [get_ports {eth_col}]

# eth_crs → J2_IO42 → Y21  (Bank 13)
#set_property PACKAGE_PIN Y21 [get_ports {eth_crs}]
#set_property IOSTANDARD LVCMOS33 [get_ports {eth_crs}]

## PHY Reset + Interrupt + Switch-Enable (optional)
# eth_rstn  → J2_IO38 → V21  (Bank 13)
#set_property PACKAGE_PIN V21 [get_ports {eth_rstn}]
#set_property IOSTANDARD LVCMOS33 [get_ports {eth_rstn}]

# eth_intb  → J2_IO36 → U21  (Bank 13)
#set_property PACKAGE_PIN U21 [get_ports {eth_intb}]
#set_property IOSTANDARD LVCMOS33 [get_ports {eth_intb}]

# eth_enswreg → J2_IO37 → V23 (Bank 13)
#set_property PACKAGE_PIN V23 [get_ports {eth_enswreg}]
#set_property IOSTANDARD LVCMOS33 [get_ports {eth_enswreg}]


###############################################################################
## F) Micro SD Card via J2_IOxx → U2 (Bank 13/15, LVCMOS33)
###############################################################################

# sd_cd_dat3  → J2_IO13 → W23  (Bank 13)
set_property PACKAGE_PIN W23 [get_ports {sd_cd_dat3}]
set_property IOSTANDARD LVCMOS33 [get_ports {sd_cd_dat3}]

# sd_cmd      → J2_IO11 → Y23  (Bank 13)
set_property PACKAGE_PIN Y23 [get_ports {sd_cmd}]
set_property IOSTANDARD LVCMOS33 [get_ports {sd_cmd}]

# sd_clk      → J2_IO9  → AA25 (Bank 13)
set_property PACKAGE_PIN AA25 [get_ports {sd_clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {sd_clk}]

# sd_dat0     → J2_IO7  → Y22  (Bank 13)
set_property PACKAGE_PIN Y22 [get_ports {sd_dat0}]
set_property IOSTANDARD LVCMOS33 [get_ports {sd_dat0}]

# sd_dat1     → J2_IO5  → AC24 (Bank 13)
set_property PACKAGE_PIN AC24 [get_ports {sd_dat1}]
set_property IOSTANDARD LVCMOS33 [get_ports {sd_dat1}]

# sd_dat2     → J2_IO3  → AB24 (Bank 13)
set_property PACKAGE_PIN AB24 [get_ports {sd_dat2}]
set_property IOSTANDARD LVCMOS33 [get_ports {sd_dat2}]

# sd_cd (card detect, optional) → J2_IO15 → W25 (Bank 13)
#set_property PACKAGE_PIN W25 [get_ports {sd_cd}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sd_cd}]


###############################################################################
## G) VGA Output via J3_IOxx → U4 (Bank 35, LVCMOS33)
###############################################################################

# vga_red0   → J3_IO46 → PACKAGE_PIN B4
set_property PACKAGE_PIN B4 [get_ports {vga_red0}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_red0}]

# vga_red1   → J3_IO47 → PACKAGE_PIN A4
set_property PACKAGE_PIN A4 [get_ports {vga_red1}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_red1}]

# vga_red2   → J3_IO48 → PACKAGE_PIN D3
set_property PACKAGE_PIN D3 [get_ports {vga_red2}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_red2}]

# vga_green0 → J3_IO49 → PACKAGE_PIN C3
set_property PACKAGE_PIN C3 [get_ports {vga_green0}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_green0}]

# vga_green1 → J3_IO50 → PACKAGE_PIN F3
set_property PACKAGE_PIN F3 [get_ports {vga_green1}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_green1}]

# vga_green2 → J3_IO51 → PACKAGE_PIN E3
set_property PACKAGE_PIN E3 [get_ports {vga_green2}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_green2}]

# vga_blue0  → J3_IO52 → PACKAGE_PIN C2
set_property PACKAGE_PIN C2 [get_ports {vga_blue0}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue0}]

# vga_blue1  → J3_IO53 → PACKAGE_PIN B2
set_property PACKAGE_PIN B2 [get_ports {vga_blue1}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue1}]

# vga_blue2  → J3_IO54 → PACKAGE_PIN A3
set_property PACKAGE_PIN A3 [get_ports {vga_blue2}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue2}]

# vga_hsync  → J3_IO55 → PACKAGE_PIN A2
set_property PACKAGE_PIN A2 [get_ports {vga_hsync}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_hsync}]

# vga_vsync  → J3_IO56 → PACKAGE_PIN C1
set_property PACKAGE_PIN C1 [get_ports {vga_vsync}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_vsync}]

# vga_sda    → J3_IO57 → PACKAGE_PIN B1
set_property PACKAGE_PIN B1 [get_ports {vga_sda}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_sda}]

# vga_scl    → J3_IO58 → PACKAGE_PIN F2
set_property PACKAGE_PIN F2 [get_ports {vga_scl}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_scl}]


###############################################################################
## H) RP2040 GPIO0 … GPIO15 (Header J2/J3 → U2/U4, LVCMOS33)
###############################################################################

# GPIO0  → J3_IO7  → PACKAGE_PIN B5
set_property PACKAGE_PIN B5 [get_ports {rp_gpio0}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio0}]

# GPIO1  → J3_IO8  → PACKAGE_PIN A5
set_property PACKAGE_PIN A5 [get_ports {rp_gpio1}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio1}]

# GPIO2  → J2_IO44 → PACKAGE_PIN D26
set_property PACKAGE_PIN D26 [get_ports {rp_gpio2}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio2}]

# GPIO3  → J2_IO43 → PACKAGE_PIN E26
set_property PACKAGE_PIN E26 [get_ports {rp_gpio3}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio3}]

# GPIO4  → J2_IO42 → PACKAGE_PIN D25
set_property PACKAGE_PIN D25 [get_ports {rp_gpio4}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio4}]

# GPIO5  → J2_IO41 → PACKAGE_PIN E25
set_property PACKAGE_PIN E25 [get_ports {rp_gpio5}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio5}]

# GPIO6  → J2_IO40 → PACKAGE_PIN G26
set_property PACKAGE_PIN G26 [get_ports {rp_gpio6}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio6}]

# GPIO7  → J2_IO39 → PACKAGE_PIN H26
set_property PACKAGE_PIN H26 [get_ports {rp_gpio7}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio7}]

# GPIO8  → J2_IO38 → PACKAGE_PIN E23
set_property PACKAGE_PIN E23 [get_ports {rp_gpio8}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio8}]

# GPIO9  → J2_IO37 → PACKAGE_PIN F23
set_property PACKAGE_PIN F23 [get_ports {rp_gpio9}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio9}]

# GPIO10 → J2_IO36 → PACKAGE_PIN F22
set_property PACKAGE_PIN F22 [get_ports {rp_gpio10}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio10}]

# GPIO11 → J2_IO35 → PACKAGE_PIN G22
set_property PACKAGE_PIN G22 [get_ports {rp_gpio11}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio11}]

# GPIO12 → J2_IO34 → PACKAGE_PIN J25
set_property PACKAGE_PIN J25 [get_ports {rp_gpio12}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio12}]

# GPIO13 → J2_IO33 → PACKAGE_PIN J26
set_property PACKAGE_PIN J26 [get_ports {rp_gpio13}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio13}]

# GPIO14 → J2_IO32 → PACKAGE_PIN G20
set_property PACKAGE_PIN G20 [get_ports {rp_gpio14}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio14}]

# GPIO15 → J2_IO31 → PACKAGE_PIN G21
set_property PACKAGE_PIN G21 [get_ports {rp_gpio15}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio15}]


###############################################################################
## I) RP2040 JTAG or SWD (choose one interface, LVCMOS33)
###############################################################################

## – If using *JTAG* (GPIO16…GPIO19) via J1 header:
##   Connect rp_tms/rp_tdi/rp_tdo/rp_tck to the FPGA’s dedicated JTAG pins.
##   For example, on the XC7A200T:
##set_property PACKAGE_PIN H11 [get_ports {rp_tms}]
##set_property IOSTANDARD LVCMOS33 [get_ports {rp_tms}]
##set_property PACKAGE_PIN H12 [get_ports {rp_tdi}]
##set_property IOSTANDARD LVCMOS33 [get_ports {rp_tdi}]
##set_property PACKAGE_PIN K11 [get_ports {rp_tdo}]
##set_property IOSTANDARD LVCMOS33 [get_ports {rp_tdo}]
##set_property PACKAGE_PIN J11 [get_ports {rp_tck}]
##set_property IOSTANDARD LVCMOS33 [get_ports {rp_tck}]

## – If using *SWD* (SWCLK/SWDIO) via J1 header:
##   Map rp_swdclk/rp_swdio to free FPGA I/Os (or the pins you desire).
##set_property PACKAGE_PIN W23 [get_ports {rp_swdclk}]
##set_property IOSTANDARD LVCMOS33 [get_ports {rp_swdclk}]
##set_property PACKAGE_PIN V21 [get_ports {rp_swdio}]
##set_property IOSTANDARD LVCMOS33 [get_ports {rp_swdio}]


###############################################################################
## J) RP2040 GPIO20 … GPIO23 (J2 → U2, LVCMOS33)
###############################################################################

# GPIO20 → J2_IO30 → PACKAGE_PIN K22
set_property PACKAGE_PIN K22 [get_ports {rp_gpio20}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio20}]

# GPIO21 → J2_IO29 → PACKAGE_PIN K23
set_property PACKAGE_PIN K23 [get_ports {rp_gpio21}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio21}]

# GPIO22 → J2_IO28 → PACKAGE_PIN V21
set_property PACKAGE_PIN V21 [get_ports {rp_gpio22}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio22}]

# GPIO23 → J2_IO27 → PACKAGE_PIN U21
set_property PACKAGE_PIN U21 [get_ports {rp_gpio23}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio23}]


###############################################################################
## K) RP2040 GPIO24 (BOOT-button) & GPIO25 (LED), LVCMOS33
###############################################################################

# GPIO24 (BOOT) → RP2040_KEY → PACKAGE_PIN Y25
set_property PACKAGE_PIN Y25 [get_ports {rp_key}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_key}]

# GPIO25 (LED) → RP2040_LED → PACKAGE_PIN AC24
set_property PACKAGE_PIN AC24 [get_ports {rp_led}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_led}]


###############################################################################
## L) RP2040 GPIO26…GPIO29 (ADC0…ADC3) on J2 → U2 (Bank 13, LVCMOS33)
##     Uncomment only if not used by SWD/JTAG/GPIO20–GPIO23 above.
###############################################################################

# GPIO26 → J2_IO26 → PACKAGE_PIN V23
#set_property PACKAGE_PIN V23 [get_ports {rp_gpio26_adc0}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio26_adc0}]

# GPIO27 → J2_IO25 → PACKAGE_PIN W23
#set_property PACKAGE_PIN W23 [get_ports {rp_gpio27_adc1}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio27_adc1}]

# GPIO28 → J2_IO16 → PACKAGE_PIN Y23
#set_property PACKAGE_PIN Y23 [get_ports {rp_gpio28_adc2}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio28_adc2}]

# GPIO29 → J2_IO15 → PACKAGE_PIN Y22
#set_property PACKAGE_PIN Y22 [get_ports {rp_gpio29_adc3}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio29_adc3}]


###############################################################################
## M) U2 & U4 2×32 Header Constraints (Prefixed with u2_/u4_) – 3.3 V LVCMOS33
###############################################################################

## ----------------------------------------------------------------------
## U2 HDR_32×2 (Bank 15 → pins 7–26, Bank 13 → pins 41–56)
##
##  • Pins  1,2,5,6,61,62 → GND (omit)
##  • Pins  3,4           → VCCO_34_35 (omit)
##  • Pins 63,64          → VIN (omit)
##  • Only the following physical pins appear as FPGA nets:
##      Pins  7…26  → u2_bank_7…u2_bank_26  (Bank 15)
##      Pins 41…56  → u2_bank_41…u2_bank_56 (Bank 13)
## ----------------------------------------------------------------------

#— Bank 15 (pins 7 → 26):
set_property PACKAGE_PIN D26 [get_ports {u2_bank_7 }]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_7 }]
set_property PACKAGE_PIN E26 [get_ports {u2_bank_8 }]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_8 }]
set_property PACKAGE_PIN D25 [get_ports {u2_bank_9 }]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_9 }]
set_property PACKAGE_PIN E25 [get_ports {u2_bank_10}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_10}]
set_property PACKAGE_PIN G26 [get_ports {u2_bank_11}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_11}]
set_property PACKAGE_PIN H26 [get_ports {u2_bank_12}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_12}]
set_property PACKAGE_PIN E23 [get_ports {u2_bank_13}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_13}]
set_property PACKAGE_PIN F23 [get_ports {u2_bank_14}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_14}]
set_property PACKAGE_PIN F22 [get_ports {u2_bank_15}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_15}]
set_property PACKAGE_PIN G22 [get_ports {u2_bank_16}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_16}]
set_property PACKAGE_PIN J25 [get_ports {u2_bank_17}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_17}]
set_property PACKAGE_PIN J26 [get_ports {u2_bank_18}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_18}]
set_property PACKAGE_PIN G20 [get_ports {u2_bank_19}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_19}]
set_property PACKAGE_PIN G21 [get_ports {u2_bank_20}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_20}]
set_property PACKAGE_PIN H21 [get_ports {u2_bank_21}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_21}]
set_property PACKAGE_PIN H22 [get_ports {u2_bank_22}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_22}]
set_property PACKAGE_PIN J21 [get_ports {u2_bank_23}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_23}]
set_property PACKAGE_PIN K21 [get_ports {u2_bank_24}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_24}]
set_property PACKAGE_PIN K22 [get_ports {u2_bank_25}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_25}]
set_property PACKAGE_PIN K23 [get_ports {u2_bank_26}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_26}]

#— Bank 13 (pins 41 → 56):
set_property PACKAGE_PIN V21 [get_ports {u2_bank_41}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_41}]
set_property PACKAGE_PIN U21 [get_ports {u2_bank_42}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_42}]
set_property PACKAGE_PIN V23 [get_ports {u2_bank_43}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_43}]
set_property PACKAGE_PIN W23 [get_ports {u2_bank_44}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_44}]
set_property PACKAGE_PIN Y23 [get_ports {u2_bank_45}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_45}]
set_property PACKAGE_PIN Y22 [get_ports {u2_bank_46}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_46}]
set_property PACKAGE_PIN AA25 [get_ports {u2_bank_47}]  set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_47}]
set_property PACKAGE_PIN Y25 [get_ports {u2_bank_48}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_48}]
set_property PACKAGE_PIN AC24 [get_ports {u2_bank_49}]  set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_49}]
set_property PACKAGE_PIN AB24 [get_ports {u2_bank_50}]  set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_50}]
set_property PACKAGE_PIN W21 [get_ports {u2_bank_51}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_51}]
set_property PACKAGE_PIN Y21 [get_ports {u2_bank_52}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_52}]
set_property PACKAGE_PIN Y26 [get_ports {u2_bank_53}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_53}]
set_property PACKAGE_PIN W25 [get_ports {u2_bank_54}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_54}]
set_property PACKAGE_PIN AC26 [get_ports {u2_bank_55}]  set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_55}]
set_property PACKAGE_PIN AB26 [get_ports {u2_bank_56}]  set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_56}]


## ----------------------------------------------------------------------
## U4 HDR_32×2 (Bank 35 → pins 7–28, Bank 34 → pins 33–60)
##
##  • Pins  1,2,5,6,61,62 → GND (omit)
##  • Pins  3,4           → VCCO_34_35 (omit)
##  • Pins 63,64          → VIN (omit)
##  • Only pins 7…28 (Bank 35) and 33…60 (Bank 34) are real I/Os.
## ----------------------------------------------------------------------

#— Bank 35 (pins 7 → 28):
set_property PACKAGE_PIN B5  [get_ports {u4_bank_7 }]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_7 }]
set_property PACKAGE_PIN A5  [get_ports {u4_bank_8 }]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_8 }]
set_property PACKAGE_PIN B4  [get_ports {u4_bank_9 }]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_9 }]
set_property PACKAGE_PIN A4  [get_ports {u4_bank_10}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_10}]
set_property PACKAGE_PIN D3  [get_ports {u4_bank_11}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_11}]
set_property PACKAGE_PIN C3  [get_ports {u4_bank_12}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_12}]
set_property PACKAGE_PIN F3  [get_ports {u4_bank_13}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_13}]
set_property PACKAGE_PIN E3  [get_ports {u4_bank_14}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_14}]
set_property PACKAGE_PIN C2  [get_ports {u4_bank_15}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_15}]
set_property PACKAGE_PIN B2  [get_ports {u4_bank_16}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_16}]
set_property PACKAGE_PIN A3  [get_ports {u4_bank_17}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_17}]
set_property PACKAGE_PIN A2  [get_ports {u4_bank_18}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_18}]
set_property PACKAGE_PIN C1  [get_ports {u4_bank_19}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_19}]
set_property PACKAGE_PIN B1  [get_ports {u4_bank_20}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_20}]
set_property PACKAGE_PIN F2  [get_ports {u4_bank_21}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_21}]
set_property PACKAGE_PIN E2  [get_ports {u4_bank_22}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_22}]
set_property PACKAGE_PIN E1  [get_ports {u4_bank_23}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_23}]
set_property PACKAGE_PIN D1  [get_ports {u4_bank_24}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_24}]
set_property PACKAGE_PIN G2  [get_ports {u4_bank_25}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_25}]
set_property PACKAGE_PIN G1  [get_ports {u4_bank_26}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_26}]
set_property PACKAGE_PIN H3  [get_ports {u4_bank_27}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_27}]

#— Bank 34 (pins 33 → 60):
set_property PACKAGE_PIN K1  [get_ports {u4_bank_33}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_33}]
set_property PACKAGE_PIN J1  [get_ports {u4_bank_34}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_34}]
set_property PACKAGE_PIN L3  [get_ports {u4_bank_35}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_35}]
set_property PACKAGE_PIN K2  [get_ports {u4_bank_36}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_36}]
set_property PACKAGE_PIN N1  [get_ports {u4_bank_37}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_37}]
set_property PACKAGE_PIN M1  [get_ports {u4_bank_38}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_38}]
set_property PACKAGE_PIN H2  [get_ports {u4_bank_39}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_39}]
set_property PACKAGE_PIN H1  [get_ports {u4_bank_40}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_40}]
set_property PACKAGE_PIN M2  [get_ports {u4_bank_41}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_41}]
set_property PACKAGE_PIN L2  [get_ports {u4_bank_42}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_42}]
set_property PACKAGE_PIN N3  [get_ports {u4_bank_43}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_43}]
set_property PACKAGE_PIN N2  [get_ports {u4_bank_44}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_44}]
set_property PACKAGE_PIN R3  [get_ports {u4_bank_45}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_45}]
set_property PACKAGE_PIN P3  [get_ports {u4_bank_46}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_46}]
set_property PACKAGE_PIN P4  [get_ports {u4_bank_47}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_47}]
set_property PACKAGE_PIN N4  [get_ports {u4_bank_48}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_48}]
set_property PACKAGE_PIN R1  [get_ports {u4_bank_49}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_49}]
set_property PACKAGE_PIN P1  [get_ports {u4_bank_50}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_50}]
set_property PACKAGE_PIN T4  [get_ports {u4_bank_51}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_51}]
set_property PACKAGE_PIN T3  [get_ports {u4_bank_52}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_52}]
set_property PACKAGE_PIN T2  [get_ports {u4_bank_53}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_53}]
set_property PACKAGE_PIN R2  [get_ports {u4_bank_54}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_54}]
set_property PACKAGE_PIN U2  [get_ports {u4_bank_55}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_55}]
set_property PACKAGE_PIN U1  [get_ports {u4_bank_56}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_56}]
set_property PACKAGE_PIN P6  [get_ports {u4_bank_57}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_57}]
set_property PACKAGE_PIN P5  [get_ports {u4_bank_58}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_58}]
set_property PACKAGE_PIN T5  [get_ports {u4_bank_59}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_59}]
set_property PACKAGE_PIN R5  [get_ports {u4_bank_60}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_60}]


## ======================================================================
## End of Full constraints.xdc
## ======================================================================
