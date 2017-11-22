library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity wait_state is
	port (
		state_en	: in std_logic;

		Ma_En		: out std_logic;
		Cd_En		: out std_logic;
		Data_Sel 	: out std_logic;
		REN 		: out std_logic;
		WEN 		: out std_logic;
		Valid_Data 	: out std_logic;
		Busy 		: out std_logic;
		Ca_En 		: out std_logic;
		Reset_St	: out std_logic);
end wait_state;

architecture structural of wait_state is

signal zero : std_logic := '0';

begin

	Cd_En <= zero;
	Ma_En <= zero;
	WEN <= zero;
	Data_Sel <= state_en;
	REN <= zero;
	Valid_Data <= zero;
	Busy <= state_en;
	Ca_En <= zero;
	Reset_St <= zero;
	
end structural;