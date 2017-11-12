#Makefile for compiling vhdl code

PARTS = or3.vhd or4.vhd and2.vhd and3.vhd or8.vhd xor2.vhd inv.vhd nand2.vhd or2.vhd mux.vhd mux8.vhd output_enable8.vhd Dlatch.vhd tx.vhd reg8.vhd 
PARTS += hit_miss.vhd cache_bit.vhd cache_byte.vhd valid_tag.vhd multiplex4_1.vhd Block_Decoder.vhd Byte_Decoder.vhd cache_block.vhd 
PARTS += multiplex8_1.vhd hit_multiplex4_1.vhd chip.vhd cache.vhd
## 
TESTS = chip_test.vhd
TEST_NAME = chip_test

all:
	make parts
	make tests
	make sim

parts:
	run_ncvhdl.bash -messages -linedebug -cdslib ./cds.lib -hdlvar ./hdl.var -smartorder $(PARTS)
	run_ncvhdl.bash -messages -linedebug -cdslib ./cds.lib -hdlvar ./hdl.var -smartorder $(TESTS)

tests:
	run_ncelab.bash -messages -access rwc -cdslib ./cds.lib -hdlvar ./hdl.var $(TEST_NAME)

sim:
	run_ncsim.bash -input run.ncsim -messages -cdslib ./cds.lib -hdlvar ./hdl.var $(TEST_NAME)

sim2:
	run_gui_sim.bash -gui $(TEST_NAME)

clean:	
	rm -rf *~
	rm -rf *#
	rm -rf *.o
