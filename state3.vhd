library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity state3 is
	port (
		state_en	: in std_logic;
		rw			: in std_logic;
		hit_miss	: in std_logic;

		Ma_En		: out std_logic;
		Cd_En		: out std_logic;
		Data_Sel 	: out std_logic;
		REN 		: out std_logic;
		WEN 		: out std_logic;
		Valid_Data 	: out std_logic;
		Busy 		: out std_logic;
		Ca_En 		: out std_logic;
		Reset_St	: out std_logic);
end state3;

architecture structural of state3 is

component and2
	port (
		input1 : in std_logic;
		input2 : in std_logic;
		output : out std_logic);
end component;

component nor2 
	port (
		input1 : in std_logic;
		input2 : in std_logic;
		output : out std_logic);
end component;

for nor2_1, nor2_2	: nor2 use entity work.nor2(structural);
for and2_1	: and2 use entity work.and2(structural);

signal temp	: std_logic_vector(2 downto 0);
signal zero : std_logic := '0';
signal one	: std_logic := '1';

begin
	
	nor2_1	:	nor2 port map(state_en, zero, temp(0));
	nor2_2	:	nor2 port map(rw, temp(0), temp(1));
	and2_1	:	and2 port map(rw, state_en, temp(2));

	Cd_En <= zero;
	Ma_En <= zero;
	WEN <= zero;
	Data_Sel <= state_en;
	REN <= zero;
	Valid_Data <= zero;
	Busy <= temp(2);
	Ca_En <= zero;
	Reset_St <= temp(1);
	
end structural;