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
## 2. Header-pins 1,2,5,6,61,62 on J2/J3 = GND (omitted), pins 3,4 = VCCO (3.3 V, omitted), pins 63,64 = VIN (omitted).
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

# prog_b → AE16 (active-low PROGRAM_B)
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
## E) Ethernet PHY (RTL8211EG) → J3_IOxx → FPGA (U4) PACKAGE_PIN (LVCMOS33)
###############################################################################

# MDIO      → J3_IO15 → U4_PACKAGE_PIN  A2    (per schematic)
set_property PACKAGE_PIN A2 [get_ports {eth_mdio}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_mdio}]

# MDC       → J3_IO16 → U4_PACKAGE_PIN  A3    (per schematic)
set_property PACKAGE_PIN A3 [get_ports {eth_mdc}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_mdc}]

# TXEN      → J3_IO28 → U4_PACKAGE_PIN  C2    (per schematic)
set_property PACKAGE_PIN C2 [get_ports {eth_tx_en}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_tx_en}]

# TXCLK     → J3_IO22 → U4_PACKAGE_PIN  D2    (moved off C1)
set_property PACKAGE_PIN D2 [get_ports {eth_tx_clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_tx_clk}]

# TXER      → J3_IO17 → U4_PACKAGE_PIN  B1
set_property PACKAGE_PIN B1 [get_ports {eth_tx_er}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_tx_er}]

# TXD0      → J3_IO27 → U4_PACKAGE_PIN  D3
set_property PACKAGE_PIN D3 [get_ports {eth_txd[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_txd[0]}]

# TXD1      → J3_IO25 → U4_PACKAGE_PIN  D1
set_property PACKAGE_PIN D1 [get_ports {eth_txd[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_txd[1]}]

# TXD2      → J3_IO24 → U4_PACKAGE_PIN  E3
set_property PACKAGE_PIN E3 [get_ports {eth_txd[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_txd[2]}]

# TXD3      → J3_IO23 → U4_PACKAGE_PIN  E2
set_property PACKAGE_PIN E2 [get_ports {eth_txd[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_txd[3]}]

# TXD4      → J3_IO21 → U4_PACKAGE_PIN  F3
set_property PACKAGE_PIN F3 [get_ports {eth_txd[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_txd[4]}]

# TXD5      → J3_IO20 → U4_PACKAGE_PIN  F2
set_property PACKAGE_PIN F2 [get_ports {eth_txd[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_txd[5]}]

# TXD6      → J3_IO19 → U4_PACKAGE_PIN  H3
set_property PACKAGE_PIN H3 [get_ports {eth_txd[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_txd[6]}]

# TXD7      → J3_IO18 → U4_PACKAGE_PIN  H2
set_property PACKAGE_PIN H2 [get_ports {eth_txd[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_txd[7]}]

# RXDV      → J3_IO42 → U4_PACKAGE_PIN  G1
set_property PACKAGE_PIN G1 [get_ports {eth_rx_dv}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_rx_dv}]

# RXCLK     → J3_IO37 → U4_PACKAGE_PIN  H1
set_property PACKAGE_PIN H1 [get_ports {eth_rx_clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_rx_clk}]

# RXER      → J3_IO32 → U4_PACKAGE_PIN  K2
set_property PACKAGE_PIN K2 [get_ports {eth_rx_er}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_rx_er}]

# RXD0      → J3_IO41 → U4_PACKAGE_PIN  K1
set_property PACKAGE_PIN K1 [get_ports {eth_rxd[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_rxd[0]}]

# RXD1      → J3_IO40 → U4_PACKAGE_PIN  J1
set_property PACKAGE_PIN J1 [get_ports {eth_rxd[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_rxd[1]}]

# RXD2      → J3_IO39 → U4_PACKAGE_PIN  L3
set_property PACKAGE_PIN L3 [get_ports {eth_rxd[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_rxd[2]}]

# RXD3      → J3_IO38 → U4_PACKAGE_PIN  M1
set_property PACKAGE_PIN M1 [get_ports {eth_rxd[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_rxd[3]}]

# RXD4      → J3_IO36 → U4_PACKAGE_PIN  M2
set_property PACKAGE_PIN M2 [get_ports {eth_rxd[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_rxd[4]}]

# RXD5      → J3_IO35 → U4_PACKAGE_PIN  L2
set_property PACKAGE_PIN L2 [get_ports {eth_rxd[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_rxd[5]}]

# RXD6      → J3_IO34 → U4_PACKAGE_PIN  N3
set_property PACKAGE_PIN N3 [get_ports {eth_rxd[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_rxd[6]}]

# RXD7      → J3_IO33 → U4_PACKAGE_PIN  N2
set_property PACKAGE_PIN N2 [get_ports {eth_rxd[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_rxd[7]}]

# COL/Mode  → J3_IO31 → U4_PACKAGE_PIN  R3
set_property PACKAGE_PIN R3 [get_ports {eth_col}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_col}]

# CRS       → J3_IO30 → U4_PACKAGE_PIN  P3
set_property PACKAGE_PIN P3 [get_ports {eth_crs}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_crs}]

# PHYRSTB   → J3_IO26 → U4_PACKAGE_PIN  P4
set_property PACKAGE_PIN P4 [get_ports {eth_rstn}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_rstn}]

# INTB      → J3_IO56 → U4_PACKAGE_PIN  N4
set_property PACKAGE_PIN N4 [get_ports {eth_intb}]
set_property IOSTANDARD LVCMOS33 [get_ports {eth_intb}]


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

# RED[3] (MSB) → J3_IO57 → U4_PACKAGE_PIN  B5
set_property PACKAGE_PIN B5 [get_ports {vga_red3}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_red3}]

# RED[2]       → J3_IO56 → U4_PACKAGE_PIN  A5
set_property PACKAGE_PIN A5 [get_ports {vga_red2}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_red2}]

# RED[1]       → J3_IO59 → U4_PACKAGE_PIN  B4
set_property PACKAGE_PIN B4 [get_ports {vga_red1}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_red1}]

# RED[0] (LSB) → J3_IO58 → U4_PACKAGE_PIN  A4
set_property PACKAGE_PIN A4 [get_ports {vga_red0}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_red0}]

# GREEN[3] (MSB) → J3_IO51 → U4_PACKAGE_PIN  D3
set_property PACKAGE_PIN D3 [get_ports {vga_green3}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_green3}]

# GREEN[2]       → J3_IO50 → U4_PACKAGE_PIN  C3
set_property PACKAGE_PIN C3 [get_ports {vga_green2}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_green2}]

# GREEN[1]       → J3_IO53 → U4_PACKAGE_PIN  F3
set_property PACKAGE_PIN F3 [get_ports {vga_green1}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_green1}]

# GREEN[0] (LSB) → J3_IO52 → U4_PACKAGE_PIN  E3
set_property PACKAGE_PIN E3 [get_ports {vga_green0}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_green0}]

# BLUE[3] (MSB)  → J3_IO46 → U4_PACKAGE_PIN  D1
set_property PACKAGE_PIN D1 [get_ports {vga_blue3}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue3}]

# BLUE[2]        → J3_IO45 → U4_PACKAGE_PIN  E2
set_property PACKAGE_PIN E2 [get_ports {vga_blue2}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue2}]

# BLUE[1]        → J3_IO48 → U4_PACKAGE_PIN  F2
set_property PACKAGE_PIN F2 [get_ports {vga_blue1}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue1}]

# BLUE[0] (LSB)  → J3_IO47 → U4_PACKAGE_PIN  E1
set_property PACKAGE_PIN E1 [get_ports {vga_blue0}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue0}]

# HSYNC          → J3_IO44 → U4_PACKAGE_PIN  C1
set_property PACKAGE_PIN C1 [get_ports {vga_hsync}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_hsync}]

# VSYNC          → J3_IO43 → U4_PACKAGE_PIN  B1
set_property PACKAGE_PIN B1 [get_ports {vga_vsync}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_vsync}]


###############################################################################
## H) RP2040 GPIO0 … GPIO15 (Header J2/J3 → U2/U4, LVCMOS33)
###############################################################################

# GPIO0  → J3_IO7  → U4_PACKAGE_PIN  H5    (moved off B5)
set_property PACKAGE_PIN H5 [get_ports {rp_gpio0}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio0}]

# GPIO1  → J3_IO8  → U4_PACKAGE_PIN  G5    (moved off A5)
set_property PACKAGE_PIN G5 [get_ports {rp_gpio1}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio1}]

# GPIO2  → J2_IO44 → U4_PACKAGE_PIN  D26
set_property PACKAGE_PIN D26 [get_ports {rp_gpio2}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio2}]

# GPIO3  → J2_IO43 → U4_PACKAGE_PIN  E26
set_property PACKAGE_PIN E26 [get_ports {rp_gpio3}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio3}]

# GPIO4  → J2_IO42 → U4_PACKAGE_PIN  D25
set_property PACKAGE_PIN D25 [get_ports {rp_gpio4}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio4}]

# GPIO5  → J2_IO41 → U4_PACKAGE_PIN  E25
set_property PACKAGE_PIN E25 [get_ports {rp_gpio5}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio5}]

# GPIO6  → J2_IO40 → U4_PACKAGE_PIN  G26
set_property PACKAGE_PIN G26 [get_ports {rp_gpio6}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio6}]

# GPIO7  → J2_IO39 → U4_PACKAGE_PIN  H26
set_property PACKAGE_PIN H26 [get_ports {rp_gpio7}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio7}]

# GPIO8  → J2_IO38 → U4_PACKAGE_PIN  E23
set_property PACKAGE_PIN E23 [get_ports {rp_gpio8}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio8}]

# GPIO9  → J2_IO37 → U4_PACKAGE_PIN  F23
set_property PACKAGE_PIN F23 [get_ports {rp_gpio9}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio9}]

# GPIO10 → J2_IO36 → U4_PACKAGE_PIN  F22
set_property PACKAGE_PIN F22 [get_ports {rp_gpio10}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio10}]

# GPIO11 → J2_IO35 → U4_PACKAGE_PIN  G22
set_property PACKAGE_PIN G22 [get_ports {rp_gpio11}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio11}]

# GPIO12 → J2_IO34 → U4_PACKAGE_PIN  J25
set_property PACKAGE_PIN J25 [get_ports {rp_gpio12}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio12}]

# GPIO13 → J2_IO33 → U4_PACKAGE_PIN  J26
set_property PACKAGE_PIN J26 [get_ports {rp_gpio13}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio13}]

# GPIO14 → J2_IO32 → U4_PACKAGE_PIN  G20
set_property PACKAGE_PIN G20 [get_ports {rp_gpio14}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio14}]

# GPIO15 → J2_IO31 → U4_PACKAGE_PIN  G21
set_property PACKAGE_PIN G21 [get_ports {rp_gpio15}]
set_property IOSTANDARD LVCMOS33 [get_ports {rp_gpio15}]


###############################################################################
## I) RP2040 JTAG or SWD (choose one interface, LVCMOS33)
###############################################################################

## – If using *JTAG* (GPIO16…GPIO19) via J1 header:
##   Connect rp_tms/rp_tdi/rp_tdo/rp_tck to the FPGA’s dedicated JTAG pins.
##   Example:
##set_property PACKAGE_PIN H11 [get_ports {rp_tms}]   set_property IOSTANDARD LVCMOS33 [get_ports {rp_tms}]
##set_property PACKAGE_PIN H12 [get_ports {rp_tdi}]   set_property IOSTANDARD LVCMOS33 [get_ports {rp_tdi}]
##set_property PACKAGE_PIN K11 [get_ports {rp_tdo}]   set_property IOSTANDARD LVCMOS33 [get_ports {rp_tdo}]
##set_property PACKAGE_PIN J11 [get_ports {rp_tck}]   set_property IOSTANDARD LVCMOS33 [get_ports {rp_tck}]

## – If using *SWD* (SWCLK/SWDIO) via J1 header:
##   Map rp_swdclk/rp_swdio to any free FPGA I/Os you choose.
##set_property PACKAGE_PIN W23 [get_ports {rp_swdclk}]   set_property IOSTANDARD LVCMOS33 [get_ports {rp_swdclk}]
##set_property PACKAGE_PIN V21 [get_ports {rp_swdio}]   set_property IOSTANDARD LVCMOS33 [get_ports {rp_swdio}]


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
##
##  • HEADER-pins  1,2,5,6,61,62  → GND (omit)
##  • HEADER-pins  3,4           → VCCO_34_35 (omit)
##  • HEADER-pins 63,64          → VIN (omit)
##
##  • Only the following physical pins appear as FPGA nets:
##      U2 pins  7…26  → u2_bank_7…u2_bank_26  (Bank 15)
##      U2 pins 41…56  → u2_bank_41…u2_bank_56 (Bank 13)
##      U4 pins  7…28  → u4_bank_7…u4_bank_28   (Bank 35)
##      U4 pins 33…60  → u4_bank_33…u4_bank_60 (Bank 34)
##
##  If you do not need “generic” header I/O in your design, you can safely comment out
##  (or remove) the entire block below. Be careful not to collide with any pin used above.
##  If you do want to use these header lines, make sure they don’t overlap with VGA/Ethernet/
##  RP2040/SD-card mappings shown above.
###############################################################################

## ----------------------------------------------------------------------
## U2 HDR_32×2 (Bank 15 → pins 7–26, Bank 13 → pins 41–56)
##
##  • u2_bank_7…u2_bank_26 ⇒ FPGA package pins: D26, E26, D25, E25, G26, H26, E23, F23,
##    F22, G22, J25, J26, G20, G21, H21, H22, J21, K21, K22, K23
##
##  • u2_bank_41…u2_bank_56 ⇒ FPGA package pins: V21, U21, V23, W23, Y23, Y22, AA25,
##    Y25, AC24, AB24, W21, Y21, Y26, W25, AC26, AB26
##
##  (Either comment out or reassign these lines if they collide with earlier peripherals)
##
#set_property PACKAGE_PIN D26 [get_ports {u2_bank_7 }]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_7 }]
#set_property PACKAGE_PIN E26 [get_ports {u2_bank_8 }]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_8 }]
#set_property PACKAGE_PIN D25 [get_ports {u2_bank_9 }]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_9 }]
#set_property PACKAGE_PIN E25 [get_ports {u2_bank_10}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_10}]
#set_property PACKAGE_PIN G26 [get_ports {u2_bank_11}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_11}]
#set_property PACKAGE_PIN H26 [get_ports {u2_bank_12}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_12}]
#set_property PACKAGE_PIN E23 [get_ports {u2_bank_13}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_13}]
#set_property PACKAGE_PIN F23 [get_ports {u2_bank_14}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_14}]
#set_property PACKAGE_PIN F22 [get_ports {u2_bank_15}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_15}]
#set_property PACKAGE_PIN G22 [get_ports {u2_bank_16}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_16}]
#set_property PACKAGE_PIN J25 [get_ports {u2_bank_17}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_17}]
#set_property PACKAGE_PIN J26 [get_ports {u2_bank_18}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_18}]
#set_property PACKAGE_PIN G20 [get_ports {u2_bank_19}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_19}]
#set_property PACKAGE_PIN G21 [get_ports {u2_bank_20}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_20}]
#set_property PACKAGE_PIN H21 [get_ports {u2_bank_21}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_21}]
#set_property PACKAGE_PIN H22 [get_ports {u2_bank_22}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_22}]
#set_property PACKAGE_PIN J21 [get_ports {u2_bank_23}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_23}]
#set_property PACKAGE_PIN K21 [get_ports {u2_bank_24}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_24}]
#set_property PACKAGE_PIN K22 [get_ports {u2_bank_25}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_25}]
#set_property PACKAGE_PIN K23 [get_ports {u2_bank_26}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_26}]

#set_property PACKAGE_PIN V21 [get_ports {u2_bank_41}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_41}]
#set_property PACKAGE_PIN U21 [get_ports {u2_bank_42}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_42}]
#set_property PACKAGE_PIN V23 [get_ports {u2_bank_43}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_43}]
#set_property PACKAGE_PIN W23 [get_ports {u2_bank_44}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_44}]
#set_property PACKAGE_PIN Y23 [get_ports {u2_bank_45}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_45}]
#set_property PACKAGE_PIN Y22 [get_ports {u2_bank_46}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_46}]
#set_property PACKAGE_PIN AA25 [get_ports {u2_bank_47}]  set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_47}]
#set_property PACKAGE_PIN Y25 [get_ports {u2_bank_48}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_48}]
#set_property PACKAGE_PIN AC24 [get_ports {u2_bank_49}]  set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_49}]
#set_property PACKAGE_PIN AB24 [get_ports {u2_bank_50}]  set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_50}]
#set_property PACKAGE_PIN W21 [get_ports {u2_bank_51}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_51}]
#set_property PACKAGE_PIN Y21 [get_ports {u2_bank_52}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_52}]
#set_property PACKAGE_PIN Y26 [get_ports {u2_bank_53}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_53}]
#set_property PACKAGE_PIN W25 [get_ports {u2_bank_54}]   set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_54}]
#set_property PACKAGE_PIN AC26 [get_ports {u2_bank_55}]  set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_55}]
#set_property PACKAGE_PIN AB26 [get_ports {u2_bank_56}]  set_property IOSTANDARD LVCMOS33 [get_ports {u2_bank_56}]


## ----------------------------------------------------------------------
## U4 HDR_32×2 (Bank 35 → pins 7–28, Bank 34 → pins 33–60)
##
##  • u4_bank_7…u4_bank_27 ⇒ FPGA package pins: B5, A5, B4, A4, D3, C3, F3, E3,
##    C2, B2, A3, A2, C1, B1, F2, E2, E1, D1, G2, G1, H3
##
##  • u4_bank_33…u4_bank_60 ⇒ FPGA package pins: K1, J1, L3, K2, N1, M1, H2, H1,
##    M2, L2, N3, N2, R3, P3, P4, N4, R1, P1, T4, T3, T2, R2, U2, U1, P6, P5, T5, R5
##
##  (Either comment out or reassign these lines if they collide with earlier peripherals)
##
#set_property PACKAGE_PIN B5  [get_ports {u4_bank_7 }]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_7 }]
#set_property PACKAGE_PIN A5  [get_ports {u4_bank_8 }]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_8 }]
#set_property PACKAGE_PIN B4  [get_ports {u4_bank_9 }]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_9 }]
#set_property PACKAGE_PIN A4  [get_ports {u4_bank_10}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_10}]
#set_property PACKAGE_PIN D3  [get_ports {u4_bank_11}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_11}]
#set_property PACKAGE_PIN C3  [get_ports {u4_bank_12}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_12}]
#set_property PACKAGE_PIN F3  [get_ports {u4_bank_13}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_13}]
#set_property PACKAGE_PIN E3  [get_ports {u4_bank_14}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_14}]
#set_property PACKAGE_PIN C2  [get_ports {u4_bank_15}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_15}]
#set_property PACKAGE_PIN B2  [get_ports {u4_bank_16}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_16}]
#set_property PACKAGE_PIN A3  [get_ports {u4_bank_17}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_17}]
#set_property PACKAGE_PIN A2  [get_ports {u4_bank_18}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_18}]
#set_property PACKAGE_PIN C1  [get_ports {u4_bank_19}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_19}]
#set_property PACKAGE_PIN B1  [get_ports {u4_bank_20}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_20}]
#set_property PACKAGE_PIN F2  [get_ports {u4_bank_21}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_21}]
#set_property PACKAGE_PIN E2  [get_ports {u4_bank_22}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_22}]
#set_property PACKAGE_PIN E1  [get_ports {u4_bank_23}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_23}]
#set_property PACKAGE_PIN D1  [get_ports {u4_bank_24}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_24}]
#set_property PACKAGE_PIN G2  [get_ports {u4_bank_25}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_25}]
#set_property PACKAGE_PIN G1  [get_ports {u4_bank_26}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_26}]
#set_property PACKAGE_PIN H3  [get_ports {u4_bank_27}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_27}]

#set_property PACKAGE_PIN K1  [get_ports {u4_bank_33}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_33}]
#set_property PACKAGE_PIN J1  [get_ports {u4_bank_34}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_34}]
#set_property PACKAGE_PIN L3  [get_ports {u4_bank_35}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_35}]
#set_property PACKAGE_PIN K2  [get_ports {u4_bank_36}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_36}]
#set_property PACKAGE_PIN N1  [get_ports {u4_bank_37}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_37}]
#set_property PACKAGE_PIN M1  [get_ports {u4_bank_38}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_38}]
#set_property PACKAGE_PIN H2  [get_ports {u4_bank_39}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_39}]
#set_property PACKAGE_PIN H1  [get_ports {u4_bank_40}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_40}]
#set_property PACKAGE_PIN M2  [get_ports {u4_bank_41}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_41}]
#set_property PACKAGE_PIN L2  [get_ports {u4_bank_42}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_42}]
#set_property PACKAGE_PIN N3  [get_ports {u4_bank_43}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_43}]
#set_property PACKAGE_PIN N2  [get_ports {u4_bank_44}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_44}]
#set_property PACKAGE_PIN R3  [get_ports {u4_bank_45}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_45}]
#set_property PACKAGE_PIN P3  [get_ports {u4_bank_46}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_46}]
#set_property PACKAGE_PIN P4  [get_ports {u4_bank_47}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_47}]
#set_property PACKAGE_PIN N4  [get_ports {u4_bank_48}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_48}]
#set_property PACKAGE_PIN R1  [get_ports {u4_bank_49}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_49}]
#set_property PACKAGE_PIN P1  [get_ports {u4_bank_50}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_50}]
#set_property PACKAGE_PIN T4  [get_ports {u4_bank_51}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_51}]
#set_property PACKAGE_PIN T3  [get_ports {u4_bank_52}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_52}]
#set_property PACKAGE_PIN T2  [get_ports {u4_bank_53}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_53}]
#set_property PACKAGE_PIN R2  [get_ports {u4_bank_54}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_54}]
#set_property PACKAGE_PIN U2  [get_ports {u4_bank_55}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_55}]
#set_property PACKAGE_PIN U1  [get_ports {u4_bank_56}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_56}]
#set_property PACKAGE_PIN P6  [get_ports {u4_bank_57}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_57}]
#set_property PACKAGE_PIN P5  [get_ports {u4_bank_58}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_58}]
#set_property PACKAGE_PIN T5  [get_ports {u4_bank_59}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_59}]
#set_property PACKAGE_PIN R5  [get_ports {u4_bank_60}]   set_property IOSTANDARD LVCMOS33 [get_ports {u4_bank_60}]


## ======================================================================
## End of Full constraints.xdc (corrected)
## ======================================================================
