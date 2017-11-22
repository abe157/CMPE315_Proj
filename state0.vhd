library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity state0 is
	port (
		state_en	: in std_logic;
		reset		: in std_logic;
		start		: in std_logic;
		
		Reset_st	: out std_logic;
		Next_st		: out std_logic;
		Ma_En 		: out std_logic;
		Cd_En 		: out std_logic;
		Data_Sel 	: out std_logic;
		REN 		: out std_logic;
		WEN 		: out std_logic;
		Valid_Data 	: out std_logic;
		Busy 		: out std_logic;
		Ca_En 		: out std_logic
		);
end state0;

architecture structural of state0 is

component inv
	port (
		input    : in  std_logic;
		output   : out std_logic);
end component;

component and3
	port (
		input1 : in std_logic;
		input2 : in std_logic;
		input3 : in std_logic;
		output : out std_logic);
end component;

component and2
	port (
		input1 : in std_logic;
		input2 : in std_logic;
		output : out std_logic);
end component;

component or2 
	port (
		input1 : in std_logic;
		input2 : in std_logic;
		output : out std_logic);
end component;

for inv_1, inv_2	: inv use entity work.inv(structural);
for and2_1, and2_2	: and2 use entity work.and2(structural);
for and3_1	: and3 use entity work.and3(structural);

signal nreset, nstart, next_1, next_2, nstate_en	: std_logic;
signal zero : std_logic := '0';
signal one 	: std_logic := '1';

begin

	inv_1	:	inv port map(reset, nreset);
	inv_2	: 	inv port map(start, nstart);
	and2_1	:	and2 port map(reset, state_en, Reset_st);
	and3_1	:	and3 port map(nreset, state_en, start, Next_st);
	and2_2	:	and2 port map(nstart, nreset, next_2);
		
	Ma_En <= zero;
	Cd_En <= zero;
	Data_Sel <= zero;
	REN <= zero;
	WEN <= zero;
	Valid_Data <= zero;
	Busy <= zero;
	Ca_En <= state_en;

end structural;