library IEEE;
library std;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;
use std.env.all;

entity cache_bit_test is

end cache_bit_test;

architecture test of cache_bit_test is

component cache_bit
  port (
    Reset      :  in std_logic;
    Write_data :  in std_logic;
    Write_en   :  in std_logic;
    Read_en    :  in std_logic;
    Read_data  :  out std_logic);
end component;

for cache_bit_temp : cache_bit use entity work.cache_bit(structural);

signal reset, wen, wdata, ren, rdata : std_logic;
	
begin
	

	cache_bit_temp : cache_bit port map(reset, wdata, wen, ren, rdata);

io_process: process

	file infile : text is in "cache_bit_in.txt";
	file outfile : text is out "cache_bit_out.txt";
	variable Input1 : std_logic_vector(3 downto 0);
	--variable Valid1, Output1 : std_logic;
	variable buf : line;

begin 


	while not (endfile(infile)) loop

	
		readline(infile, buf);
		read (buf, Input1);
		reset <= Input1(3);
		wdata <= Input1(2);
		wen <= Input1(1);
		ren <= Input1(0);

		wait for 10 ns;

		
		write(buf, string'(" Reset: "));
		write(buf, reset);
		write(buf, string'(" Write Data: "));
		write(buf, wdata);
		write(buf, string'(" Write Enable: "));
		write(buf, wen);
		write(buf, string'(" Read Enable: "));
		write(buf, ren);
		writeline(outfile, buf);

		write(buf, string'(" Read Data: "));
		write(buf, rdata);
		
		writeline(outfile,buf);
		writeline(outfile,buf);

	end loop;
	stop(0);
	
end process io_process;

end test;