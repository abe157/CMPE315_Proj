#Makefile for compiling vhdl code

PARTS = or3.vhd or4.vhd and2.vhd and3.vhd or8.vhd xor2.vhd inv.vhd nand2.vhd or2.vhd mux.vhd mux8.vhd output_enable.vhd Dlatch.vhd tx.vhd reg8.vhd 
PARTS += hit_miss.vhd cache_bit.vhd cache_byte.vhd valid_tag.vhd multiplex4_1.vhd Block_Decoder.vhd Byte_Decoder.vhd cache_block.vhd 
PARTS += multiplex8_1.vhd hit_multiplex4_1.vhd chip.vhd cache.vhd

#states code 
#PARTS += state0.vhd
#chip test is already included below
#cache_block_test
TEST_NAME = hit_miss_test Dlatch_test cache_bit_test cache_byte_test valid_tag_test multiplex4_1_test cache_block_test Byte_Decoder_test
TEST_NAME += Block_Decoder_test

#states tests 
#TEST_NAME += state0_test

all:
	make parts
	make tests
	make sim

parts:
	run_ncvhdl.bash -messages -linedebug -cdslib ./cds.lib -hdlvar ./hdl.var -smartorder $(PARTS)
	for d in $(TEST_NAME); do\
		run_ncvhdl.bash -messages -linedebug -cdslib ./cds.lib -hdlvar ./hdl.var -smartorder $$d\.vhd; \
	done

tests:
	for t in $(TEST_NAME) chip_test; do\
		run_ncelab.bash -messages -access rwc -cdslib ./cds.lib -hdlvar ./hdl.var $$t; \
	done;

sim:
	for d in $(TEST_NAME); do\
		run_ncsim.bash -messages -cdslib ./cds.lib -hdlvar ./hdl.var $$d ; \
	done
	run_ncsim.bash -input chip_test_run.ncsim -messages -cdslib ./cds.lib -hdlvar ./hdl.var  chip_test

sim2:
	run_gui_sim.bash -gui chip_test

testing:
	@read -p "What test would you like to run?: " temp_test; \
	run_ncvhdl.bash -messages -linedebug -cdslib ./cds.lib -hdlvar ./hdl.var -smartorder $$temp_test\.vhd; \
	run_ncelab.bash -messages -access rwc -cdslib ./cds.lib -hdlvar ./hdl.var $$temp_test; \
	run_ncsim.bash -messages -cdslib ./cds.lib -hdlvar ./hdl.var $$temp_test;

part:
	@read -p "What part would you like to make?: " temp_part; \
	run_ncvhdl.bash -messages -linedebug -cdslib ./cds.lib -hdlvar ./hdl.var -smartorder $$temp_part\.vhd;

clean:	
	rm -rf *~
	rm -rf *#
	rm -rf *.o
	rm -rf *out.txt
