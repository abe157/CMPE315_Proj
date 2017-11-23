library IEEE;
library std;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;
use std.env.all;

entity Dlatch_test is

end Dlatch_test;

architecture test of Dlatch_test is

component Dlatch                       
  port ( d   : in  std_logic;
         clk : in  std_logic;
         q   : out std_logic;
         qbar: out std_logic); 
end component; 

for Dlatch_temp : Dlatch use entity work.Dlatch(structural);

signal d_1, clk_1, q_1, q_bar_1 : std_logic;

begin
	

	Dlatch_temp : Dlatch port map(d_1, clk_1, q_1, q_bar_1);

io_process: process

	file infile : text is in "Dlatch_in.txt";
	file outfile : text is out "Dlatch_out.txt";
	variable Input1 : std_logic_vector(1 downto 0);
	variable q_2, q_bar_2 : std_logic;
	variable buf : line;

begin 


	while not (endfile(infile)) loop

	
		readline(infile, buf);
		read (buf, Input1);
		d_1 <= Input1(0);
		clk_1 <= Input1(1);
		
		wait for 10 ns;
		
		q_2:=q_1;
		q_bar_2:=q_bar_1;
		
		write(buf, string'(" D: "));
		write(buf, d_1);
		write(buf, string'(" CLK: "));
		write(buf, clk_1);
		writeline(outfile, buf);

		write(buf, string'(" Q: "));
		write(buf, q_2);
		write(buf, string'(" ~Q: "));
		write(buf, q_bar_2);
		
		writeline(outfile,buf);
		writeline(outfile,buf);

	end loop;
	stop(0);
	
end process io_process;

end test;