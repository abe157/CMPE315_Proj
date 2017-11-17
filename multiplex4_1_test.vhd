library IEEE;
library std;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;
use std.env.all;

entity multiplex4_1_test is

end multiplex4_1_test;

architecture test of multiplex4_1_test is

component multiplex4_1
	port (
		input0 :  in std_logic_vector(7 downto 0);  
    	input1 :  in std_logic_vector(7 downto 0);
    	input2 :  in std_logic_vector(7 downto 0);
    	input3 :  in std_logic_vector(7 downto 0);
		en     :  in std_logic_vector(3 downto 0);
    	output :  out std_logic_vector(7 downto 0)
		);
end component;

for multiplex4_1_temp : multiplex4_1 use entity work.multiplex4_1(structural);

signal in0, in1, in2, in3, out0 : std_logic_vector(7 downto 0);
signal en : std_logic_vector(3 downto 0);
	
begin
	

	multiplex4_1_temp : multiplex4_1 port map(in0, in1, in2, in3, en, out0);

io_process: process

	file infile : text is in "multiplex4_1_in.txt";
	file outfile : text is out "multiplex4_1_out.txt";
	variable Input1 : std_logic_vector(7 downto 0);
	variable Input2 : std_logic_vector(3 downto 0);
	variable buf : line;

begin 

	readline(infile, buf);
	read (buf, Input1);
	in0 <= Input1;
	readline(infile, buf);
	read (buf, Input1);
	in1 <= Input1;
	readline(infile, buf);
	read (buf, Input1);
	in2 <= Input1;
	readline(infile, buf);
	read (buf, Input1);
	in3 <= Input1;
	


	while not (endfile(infile)) loop

	
		readline(infile, buf);
		read (buf, Input2);
		en <= Input2;

		wait for 10 ns;

		
		write(buf, string'(" In0: "));
		write(buf, in0);
		write(buf, string'(" In0: "));
		write(buf, in1);
		write(buf, string'(" In0: "));
		write(buf, in2);
		write(buf, string'(" In0: "));
		write(buf, in3);
		writeline(outfile, buf);

		write(buf, string'(" En: "));
		write(buf, en);
		write(buf, string'(" Output: "));
		write(buf, out0);
		
		writeline(outfile,buf);
		writeline(outfile,buf);

	end loop;
	stop(0);
	
end process io_process;

end test;