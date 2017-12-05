#Makefile for compiling vhdl code

PARTS = xor2.vhd and2.vhd and3.vhd inv.vhd nand2.vhd nor2.vhd or2.vhd or3.vhd or4.vhd or8.vhd Dlatch.vhd latch.vhd tx.vhd
PARTS += hit_miss.vhd Byte_Decoder.vhd Block_Decoder.vhd
PARTS += mux.vhd mux8.vhd hit_multiplex4_1.vhd multiplex4_1_test.vhd multiplex4_1.vhd multiplex8_1.vhd
PARTS += valid_tag.vhd cache_bit.vhd cache_byte.vhd cache_block.vhd cache.vhd
PARTS += output_enable.vhd output_enable8.vhd
PARTS += reg.vhd reg8.vhd
PARTS += shift_reg.vhd shift_reg20.vhd
PARTS += state0.vhd state1.vhd state2.vhd state3.vhd wait_state.vhd state10.vhd state11.vhd state12.vhd state13.vhd state14.vhd state15.vhd state16.vhd state17.vhd state18.vhd state19.vhd state_machine.vhd
PARTS += chip.vhd

#chip tests, chip test is already included
TEST_NAME = hit_miss_test Dlatch_test cache_bit_test cache_byte_test valid_tag_test multiplex4_1_test cache_block_test Byte_Decoder_test
TEST_NAME += Block_Decoder_test shift_reg20_test

TEST_PRINT = hit_miss Dlatch cache_bit cache_byte valid_tag multiplex4_1 cache_block Byte_Decoder
TEST_PRINT += Block_Decoder shift_reg20



all:
	make parts
	make tests
	make sim

print_code:
	for d in $(TEST_NAME); do\
		echo '=======================================' >> print_code.txt; \
		echo $$d\.vhd >> print_code.txt; \
		echo '=======================================' >> print_code.txt; \
		echo '' >> print_code.txt; \
		echo '' >> print_code.txt; \
		cat $$d\.vhd >> print_code.txt; \
	done;

parts:
	run_ncvhdl.bash -messages -linedebug -cdslib ./cds.lib -hdlvar ./hdl.var -smartorder $(PARTS)
	for d in $(TEST_NAME); do\
		run_ncvhdl.bash -messages -linedebug -cdslib ./cds.lib -hdlvar ./hdl.var -smartorder $$d\.vhd; \
	done

tests:
	for t in $(TEST_NAME); do\
		run_ncelab.bash -messages -access rwc -cdslib ./cds.lib -hdlvar ./hdl.var $$t; \
	done;

sim:
	for d in $(TEST_NAME); do\
		run_ncsim.bash -messages -cdslib ./cds.lib -hdlvar ./hdl.var $$d ; \
	done;
	make chip_test;

chip_test:
	run_ncvhdl.bash -messages -linedebug -cdslib ./cds.lib -hdlvar ./hdl.var -smartorder chip_test.vhd;
	run_ncelab.bash -messages -access rwc -cdslib ./cds.lib -hdlvar ./hdl.var chip_test;
	run_ncsim.bash -input chip_test_run.ncsim -messages -cdslib ./cds.lib -hdlvar ./hdl.var  chip_test

sim2:
	run_gui_sim.bash -gui chip_test

test:
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

