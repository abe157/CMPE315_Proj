library IEEE;
library std;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;
use std.env.all;

entity hit_miss_test is

end hit_miss_test;

architecture test of hit_miss_test is

component hit_miss
  port (
	input1 : in std_logic_vector(2 downto 0);
	input2 : in std_logic_vector(2 downto 0);
	valid  : in std_logic;
	output : out std_logic);
end component;

for hit_miss_temp : hit_miss use entity work.hit_miss(structural);

signal in1, in2 : std_logic_vector(2 downto 0);
signal v1, out1 : std_logic;
	
begin
	

	hit_miss_temp : hit_miss port map(in1, in2, v1, out1);

io_process: process

	file infile : text is in "hit_miss_in.txt";
	file outfile : text is out "hit_miss_out.txt";
	variable Input1, Input2 : std_logic_vector(2 downto 0);
	variable Valid1, Output1 : std_logic;
	variable buf : line;

begin 


	while not (endfile(infile)) loop

	
		readline(infile, buf);
		read (buf, Input1);
		in1 <= Input1;
		
		readline(infile, buf);
		read(buf, Input2);
		in2 <= Input2;
		
		readline(infile, buf);
		read(buf, Valid1);
		v1 <= Valid1;

		wait for 10 ns;
		
		Output1:=out1;
		
		write(buf, string'(" Input 1: "));
		write(buf, in1);
		write(buf, string'(" Input 2: "));
		write(buf, in2);
		write(buf, string'(" Valid: "));
		write(buf, v1);
		writeline(outfile,buf);

		write(buf, string'(" Output: "));
		write(buf, Output1);
		writeline(outfile,buf);
		writeline(outfile,buf);

	end loop;
	stop(0);
	
end process io_process;

end test;