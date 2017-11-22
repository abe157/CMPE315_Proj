library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity state2 is
	port (
		state_en	: in std_logic;
		rw			: in std_logic;
		hit_miss	: in std_logic;
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
		byte_out	: out std_logic_vector(1 downto 0));
end state2;

architecture structural of state2 is

component and2
	port (
		input1 : in std_logic;
		input2 : in std_logic;
		output : out std_logic);
end component;

component nand2
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

component inv
	port (
		input    : in  std_logic;
		output   : out std_logic);
end component;

component and3
  port (
	input1   : in  std_logic;
	input2   : in  std_logic;
	input3	 : in std_logic;
	output   : out std_logic);
end component;

for nand2_1, nand2_2, nand2_3, nand2_4	: nand2 use entity work.nand2(structural);
for or2_1, or2_2, or2_3, or2_4 : or2 use entity work.or2(structural);
for and2_1, and2_2, and2_3, and2_4: and2 use entity work.and2(structural);

signal temp	: std_logic_vector(8 downto 0);
signal or_temp : std_logic;
signal zero : std_logic := '0';
signal one	: std_logic := '1';

begin
	
	nand2_1	:	nand2 port map(state_en, one, temp(0));
	or2_1	:	or2 port map(rw, temp(0), temp(1));
	nand2_2	:	nand2 port map(temp(1), temp(5), temp(2));
	or2_2	:	or2 port map(temp(0), temp(2), temp(3));
	nand2_3	:	nand2 port map(temp(3), one, temp(4));
	or2_3	:	or2 port map(hit_miss, temp(0), temp(5));
	nand2_4	:	nand2 port map(one, temp(5), temp(6));
	and2_1	:	and2 port map(rw, temp(2), temp(7));
	and2_2	:	and2 port map(temp(2), temp(5), temp(8));	
	
	Cd_En <= temp(4);
	Ma_En <= temp(7);
	--!!!WEN <= temp(8);
	WEN <= zero;
	Data_Sel <= temp(6);
	REN <= temp(4);
	Valid_Data <= state_en;
	Busy <= temp(2);
	Ca_En <= zero;
	Reset_St <= temp(4);
	
	or2_4	:	or2 port map(temp(4), temp(8), or_temp);
	and2_3	:	and2 port map(or_temp, byte_offset(0), byte_out(0));
	and2_4	:	and2 port map(or_temp, byte_offset(1), byte_out(1));
	
end structural;