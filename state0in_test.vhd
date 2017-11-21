library IEEE;
library std;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;
use std.env.all;

entity state0in_test is

end state0in_test;

architecture test of state0in_test is

component state0in
	port (
		state_en	: in std_logic;
		reset		: in std_logic;
		start		: in std_logic;
		
		Reset_st	: out std_logic;
		Next_st		: out std_logic);
end component;


for sm	:	state0in use entity work.state0in(structural);


signal state_en, reset, start, Reset_st, Next_st : std_logic;

	
begin
	
	sm : state0in port map(state_en, reset, start, Reset_st, Next_st);

io_process: process

	file infile : text is in "state0in_in.txt";
	file outfile : text is out "state0in_out.txt";
	variable Input1 : std_logic_vector(2 downto 0);
	variable buf : line;

begin 


	while not (endfile(infile)) loop

	
		readline(infile, buf);
		read (buf, Input1);
		state_en <= Input1(2);
		start <= Input1(1);
		reset <= Input1(0);

		wait for 10 ns;
		
		write(buf, string'(" State Enable: "));
		write(buf, state_en);
		write(buf, string'(" Reset: "));
		write(buf, reset);
		write(buf, string'(" Start: "));
		write(buf, start);
		writeline(outfile,buf);

		write(buf, string'(" Reset State: "));
		write(buf, Reset_st);
		write(buf, string'(" Next State: "));
		write(buf, Next_st);
		writeline(outfile,buf);
		writeline(outfile,buf);
		

	end loop;
	stop(0);
	
end process io_process;

end test;