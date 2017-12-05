library IEEE;
library std;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;
use std.env.all;

entity shift_reg20_test is

end shift_reg20_test;

architecture test of shift_reg20_test is

component shift_reg20 
	port (
		reset	:  in std_logic;
		clk		:  in std_logic;
		q		:  out std_logic_vector(19 downto 0);
		qbar	:  out std_logic_vector(19 downto 0));
end component;

for shift_reg20_temp : shift_reg20 use entity work.shift_reg20(structural);

signal q, qbar : std_logic_vector(19 downto 0);
signal reset, clk : std_logic;
	
begin
	

	shift_reg20_temp : shift_reg20 port map(reset, clk, q, qbar);

io_process: process

	file infile : text is in "shift_reg20_in.txt";
	file outfile : text is out "shift_reg20_out.txt";
	variable Input1 : std_logic_vector(1 downto 0);
	variable buf : line;

begin 


	while not (endfile(infile)) loop

	
		readline(infile, buf);
		read (buf, Input1);
		clk <= Input1(1);
		reset <= Input1(0);

		wait for 10 ns;
		
		write(buf, string'(" Reset: "));
		write(buf, reset);
		write(buf, string'(" CLK: "));
		write(buf, clk);
		writeline(outfile,buf);

		write(buf, string'(" Q: "));
		write(buf, q);
		write(buf, string'(" ~Q: "));
		write(buf, qbar);
		writeline(outfile,buf);
		writeline(outfile,buf);
		

		

	end loop;
	stop(0);
	
end process io_process;

end test;