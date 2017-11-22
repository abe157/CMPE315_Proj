library IEEE;
library std;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;
use std.env.all;

entity cache_block_test is

end cache_block_test;

architecture test of cache_block_test is

component cache_block
  port (
  	Reset      :  in std_logic;
    Write_data :  in std_logic_vector(7 downto 0);
    Ca_tag     :  in std_logic_vector(2 downto 0);
    Valid_data :  in std_logic;
    Byte_Enable:  in std_logic_vector(3 downto 0);
    Block_Enable: in std_logic;
    Write_en   :  in std_logic;
    Read_en    :  in std_logic;
    Read_valid_data : out std_logic;
    Read_tag_data  :  out std_logic_vector(2 downto 0);
    Read_data  :  out std_logic_vector(7 downto 0));
end component;


for cache_block_temp : cache_block use entity work.cache_block(structural);

-- Inputs
signal reset, wen, ren : std_logic;
signal wvdata, blocken : std_logic;
signal wdata  : std_logic_vector(7 downto 0);
signal wtdata : std_logic_vector(2 downto 0);
signal byteen : std_logic_vector(3 downto 0);
-- Outputs
signal rtdata : std_logic_vector(2 downto 0);
signal rvdata : std_logic;
signal rdata  : std_logic_vector(7 downto 0);
	
begin
	

	cache_block_temp : cache_block port map(reset, wdata, wtdata, wvdata, byteen, blocken, wen, ren, rvdata, rtdata, rdata);

io_process: process

	file infile : text is in "cache_block_in.txt";
	file outfile : text is out "cache_block_out.txt";
	variable Input1 : std_logic_vector(3 downto 0);
	variable Input2 : std_logic_vector(7 downto 0);
	variable Input3 : std_logic_vector(2 downto 0);
	variable Input4 : std_logic;
	--variable temp : std_logic_vector(19 downto 0);
	
	variable buf : line;

begin 


	while not (endfile(infile)) loop

	
		readline(infile, buf);
		read (buf, Input1);
		reset <= Input1(3);
		wen <= Input1(2);
		ren <= Input1(1);
		blocken <= Input1(0);
		
		readline(infile, buf);
		read (buf, Input1);
		byteen <= Input1;
		
		readline(infile, buf);
		read (buf, Input2);
		wdata <= Input2;
		
		readline(infile, buf);
		read (buf, Input3);
		wtdata <= Input3;
		
		readline(infile, buf);
		read (buf, Input4);
		wvdata <= Input4;

		wait for 20 ns;
		
		--wen <= '0';
		
		--wait for 40 ns;
		
		
		write(buf, string'(" Reset: "));
		write(buf, reset);
		write(buf, string'(" Write Enable: "));
		write(buf, wen);
		write(buf, string'(" Read Enable: "));
		write(buf, ren);
		write(buf, string'(" Block Enable: "));
		write(buf, blocken);
		writeline(outfile, buf);
		
		write(buf, string'(" Byte Enable: "));
		write(buf, byteen);
		write(buf, string'(" Write Data: "));
		write(buf, wdata);
		write(buf, string'(" Write Tag Data: "));
		write(buf, wtdata);
		write(buf, string'(" Write Valid Data: "));
		write(buf, wvdata);
		writeline(outfile, buf);

		write(buf, string'(" Read Data: "));
		write(buf, rdata);
		write(buf, string'(" Read Tag Data: "));
		write(buf, rtdata);
		write(buf, string'(" Read Valid Data: "));
		write(buf, rvdata);
		
		writeline(outfile,buf);
		writeline(outfile,buf);

	end loop;
	stop(0);
	
end process io_process;

end test;