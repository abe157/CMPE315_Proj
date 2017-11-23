library IEEE;
library std;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;
use std.env.all;

entity state_machine_test is

end state_machine_test;

architecture test of state_machine_test is

component state_machine
  port (
		clk : in std_logic;
		Read_Write : in std_logic;
		Start : in std_logic;
		Reset : in std_logic;
		Hit_Miss : in std_logic;
		Ca : in std_logic_vector(7 downto 0);

		Ma : out std_logic_vector(7 downto 0);
		Ma_En : out std_logic;
		Cd_En : out std_logic;
		Data_Sel : out std_logic;
		REN : out std_logic;
		WEN : out std_logic;
		Valid_Data : out std_logic;
		Cache_Reset : out std_logic;
		Busy : out std_logic);
end component;


for sm	:	state_machine use entity work.state_machine(structural);


signal ca, ma : std_logic_vector(7 downto 0);
signal clk, rdwr, start, reset, hit_miss, ma_en, cd_en, data_sel, ren, wen, valid_data, cache_reset, busy : std_logic;
	
begin
	
	sm : state_machine port map(clk, rdwr, start, reset, hit_miss, ca, ma, ma_en, cd_en, data_sel, ren, wen, valid_data, cache_reset, busy);

io_process: process

	file infile : text is in "state_machine_in.txt";
	file outfile : text is out "state_machine_out.txt";
	variable Input1 : std_logic_vector(2 downto 0);
	variable buf : line;

begin 


	while not (endfile(infile)) loop

	
		readline(infile, buf);
		read (buf, Input1);
		clk <= Input1(2);
		rdwr <= '0';
		start <= Input1(1);
		reset <= Input1(0);
		hit_miss <= '0';
		

		wait for 10 ns;
		
		write(buf, string'(" CLK: "));
		write(buf, clk);
		write(buf, string'(" START: "));
		write(buf, start);
		write(buf, string'(" RESET: "));
		write(buf, reset);
		writeline(outfile,buf);

		write(buf, string'(" Busy: "));
		write(buf, busy);
		

		write(buf, string'(" State: "));
		write(buf, ma);	
		
		writeline(outfile,buf);
		writeline(outfile,buf);
		

	end loop;
	stop(0);
	
end process io_process;

end test;