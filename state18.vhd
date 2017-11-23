library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity state18 is
	port (
		state_en	: in std_logic;
		byte_offset	: in std_logic_vector(1 downto 0);
		
		Ma_En		: out std_logic;
		Cd_En		: out std_logic;
		Data_Sel 	: out std_logic;
		REN 		: out std_logic;
		WEN 		: out std_logic;
		Valid_Data 	: out std_logic;
		Busy 		: out std_logic;
		Ca_En 		: out std_logic;
		Reset_St	: out std_logic;
		byte_out  	: out std_logic_vector(1 downto 0));
end state18;

architecture structural of state18 is

component and2
	port (
		input1 : in std_logic;
		input2 : in std_logic;
		output : out std_logic);
end component;

for and2_1, and2_2 : and2 use entity work.and2(structural);

signal zero : std_logic := '0';

begin
	
	and2_1 : and2 port map(byte_offset(0), state_en, byte_out(0));
	and2_2 : and2 port map(byte_offset(1), state_en, byte_out(1));
	
	Cd_En <= zero;
	Ma_En <= zero;
	WEN <= zero;
	Data_Sel <= state_en;
	REN <= state_en;
	Valid_Data <= state_en;
	Busy <= state_en;
	Ca_En <= zero;
	Reset_St <= zero;
	
end structural;