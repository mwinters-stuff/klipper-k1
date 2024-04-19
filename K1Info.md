# info command

 [#] get_sn_mac.sh sn
88153328038725
 [#] get_sn_mac.sh mac
FCEE28038725
 [#] get_sn_mac.sh model
K1C
 [#] get_sn_mac.sh board
CR4CU220812S12
 [#] get_sn_mac.sh pcba_test
0
 [#] get_sn_mac.sh machine_sn
10000643571D524ACJU
 [#] get_sn_mac.sh structure_version
0

board ==   "CR4CU220812S10" | "CR4CU220812S11" | "CR4CU220812S12"

CR4CU220812S12 == K1C

# mcu ports
mcu0_serial=/dev/ttyS7
bed0_serial=/dev/ttyS9
noz0_serial=/dev/ttyS1

# stop clipper on mcu

/etc/init.d/S57klipper_mcu stop
/etc/init.d/S55klipper_service stop
/etc/init.d/S56moonraker_service  stop

# reset mcu
mcu_reset.sh
# handshake with mcu
mcu_util -i port -c


# firmware update
mcu_util -i $tty_path -u -f $fw_path

# start mcu
mcu_util -i $tty_path -s


 [#] mcu_reset.sh
 [#] mcu_util  -i /dev/ttyS7 -c -v
rec: 0x75, 
usart_sent_retval: 0, usart_rec_retval: 0
 [#] mcu_util  -i /dev/ttyS7 -g
mcu0_120_G32-mcu0_004_000

 [#] mcu_reset.sh
 [#] mcu_util  -i /dev/ttyS9 -c -v
rec: 0x75, 
usart_sent_retval: 0, usart_rec_retval: 0
 [#] mcu_util  -i /dev/ttyS9 -g
bed0_110_G21-bed0_004_000

oot@K1C-8725 /etc/init.d [#] mcu_reset.sh
 [#] mcu_util  -i /dev/ttyS1 -c
 [#] mcu_util  -i /dev/ttyS1 -g
noz0_120_G30-noz0_003_000


