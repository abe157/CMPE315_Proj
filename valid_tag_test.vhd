library IEEE;
library std;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;
use std.env.all;

entity valid_tag_test is

end valid_tag_test;

architecture test of valid_tag_test is

component Valid_tag
  port (
    Reset      :  in std_logic;
    Write_data :  in std_logic_vector(2 downto 0);
    Valid_data :  in std_logic;
    Write_en   :  in std_logic;
    Read_en    :  in std_logic;
    Read_valid_data : out std_logic;
    Read_tag_data  :  out std_logic_vector(2 downto 0));
end component;

for valid_tag_temp : valid_tag use entity work.valid_tag(structural);

signal reset, wen, ren, wvdata, rvdata : std_logic;
signal wtdata, rtdata : std_logic_vector(2 downto 0); --write/read tag data
	
begin
	

	valid_tag_temp : valid_tag port map(reset, wtdata, wvdata, wen, ren, rvdata, rtdata);

io_process: process

	file infile : text is in "valid_tag_in.txt";
	file outfile : text is out "valid_tag_out.txt";
	variable Input1 : std_logic_vector(2 downto 0);
	variable Input2 : std_logic;
	variable buf : line;

begin 


	while not (endfile(infile)) loop

	
		readline(infile, buf);
		read (buf, Input1);
		reset <= Input1(2);
		wen <= Input1(1);
		ren <= Input1(0);
		
		readline(infile, buf);
		read(buf, Input1);
		wtdata <= Input1;
		
		readline(infile, buf);
		read (buf, Input2);
		wvdata <= Input2;
		

		wait for 10 ns;

		
		write(buf, string'(" Reset: "));
		write(buf, reset);
		write(buf, string'(" Write Endable: "));
		write(buf, wen);
		write(buf, string'(" Read Enable: "));
		write(buf, ren);
		write(buf, string'(" Write Tag Data: "));
		write(buf, wtdata);
		write(buf, string'(" Write Valid Data: "));
		write(buf, wvdata);
		writeline(outfile, buf);

		write(buf, string'(" Read Valid Data: "));
		write(buf, rvdata);
		write(buf, string'(" Read Tag Data: "));
		write(buf, rtdata);
		
		writeline(outfile,buf);
		writeline(outfile,buf);

	end loop;
	stop(0);
	
end process io_process;

end test;