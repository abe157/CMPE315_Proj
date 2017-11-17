library IEEE;
library std;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;
use std.env.all;

entity output_enable_test is

end output_enable_test;

architecture test of output_enable_test is

component output_enable
  port (
    input : in std_logic_vector(7 downto 0);
    en : in std_logic;
    output : out std_logic_vector(7 downto 0));
end component;

for output_enable_temp : output_enable use entity work.output_enable(structural);

signal in1, out1 : std_logic_vector(7 downto 0);
signal en1  : std_logic;
	
begin

	output_enable_temp : output_enable port map(in1, en1, out1);

io_process: process

	file infile : text is in "output_enable_in.txt";
	file outfile : text is out "output_enable_out.txt";
	variable Input1 : std_logic_vector(7 downto 0);
	variable Input2 : std_logic;
	variable buf : line;

begin 

	readline(infile, buf);
	read (buf, Input1);
	in1 <= Input1;

	while not (endfile(infile)) loop

		readline(infile, buf);
		read(buf, Input2);
		en1 <= Input2;

		wait for 10 ns;
		
		
		write(buf, string'(" Input: "));
		write(buf, in1);
		write(buf, string'(" Enable: "));
		write(buf, en1);
		writeline(outfile,buf);

		write(buf, string'(" Output: "));
		write(buf, out1);
		writeline(outfile,buf);
		writeline(outfile,buf);

	end loop;
	stop(0);
	
end process io_process;

end test;