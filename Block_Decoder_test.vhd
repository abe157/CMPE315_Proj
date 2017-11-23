library IEEE;
library std;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;
use std.env.all;

entity Block_Decoder_test is

end Block_Decoder_test;

architecture test of Block_Decoder_test is

component Block_Decoder 
  port (
    Block_Offset : in std_logic_vector(2 downto 0);
	Output 		 : out std_logic_vector(7 downto 0));
end component;


for Block_Decoder_temp : Block_Decoder use entity work.Block_Decoder(structural);

signal offset : std_logic_vector(2 downto 0);
signal out1   : std_logic_vector(7 downto 0);
	
begin
	

	Block_Decoder_temp : Block_Decoder port map(offset, out1);

io_process: process

	file infile : text is in "Block_Decoder_in.txt";
	file outfile : text is out "Block_Decoder_out.txt";
	variable Input1 : std_logic_vector(2 downto 0);
	variable buf : line;

begin 


	while not (endfile(infile)) loop

		readline(infile, buf);
		read (buf, Input1);
		offset <= Input1;

		wait for 10 ns;

		
		write(buf, string'(" Offset: "));
		write(buf, offset);
		writeline(outfile, buf);

		write(buf, string'(" Output: "));
		write(buf, out1);
		
		writeline(outfile,buf);
		writeline(outfile,buf);

	end loop;
	stop(0);
	
end process io_process;

end test;