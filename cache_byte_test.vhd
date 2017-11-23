library IEEE;
library std;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;
use std.env.all;

entity cache_byte_test is

end cache_byte_test;

architecture test of cache_byte_test is

component cache_byte
  port (
  	Reset      :  in std_logic;
    Write_data :  in std_logic_vector(7 downto 0);
    Write_en   :  in std_logic;
    Read_en    :  in std_logic; 
    Read_data  :  out std_logic_vector(7 downto 0));
end component;

for cache_byte_temp : cache_byte use entity work.cache_byte(structural);

signal reset, wen, ren : std_logic;
signal wdata, rdata : std_logic_vector(7 downto 0);
	
begin
	

	cache_byte_temp : cache_byte port map(reset, wdata, wen, ren, rdata);

io_process: process

	file infile : text is in "cache_byte_in.txt";
	file outfile : text is out "cache_byte_out.txt";
	variable Input1 : std_logic_vector(2 downto 0);
	variable Input2 : std_logic_vector(7 downto 0);
	variable buf : line;

begin 


	while not (endfile(infile)) loop

	
		readline(infile, buf);
		read (buf, Input1);
		reset <= Input1(2);
		wen <= Input1(1);
		ren <= Input1(0);
		
		readline(infile, buf);
		read (buf, Input2);
		wdata <= Input2;
		

		wait for 10 ns;

		
		write(buf, string'(" Reset: "));
		write(buf, reset);
		write(buf, string'(" Write Data: "));
		write(buf, wdata);
		write(buf, string'(" Write Endable: "));
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