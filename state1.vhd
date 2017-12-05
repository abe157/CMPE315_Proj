library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity state1 is
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
		byte_out	: out std_logic_vector(1 downto 0));
end state1;

architecture structural of state1 is

component and3
	port (
		input1 : in std_logic;
		input2 : in std_logic;
		input3 : in std_logic;
		output : out std_logic);
end component;

component or2 
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

component and2
	port (
		input1 : in std_logic;
		input2 : in std_logic;
		output : out std_logic);
end component;

for nor2_1, nor2_2, nor2_3, nor2_4	: nor2 use entity work.nor2(structural);
for or2_1, or2_2 : or2 use entity work.or2(structural);
for and3_1	: and3 use entity work.and3(structural);
for and2_1, and2_2 : and2 use entity work.and2(structural);

signal temp	: std_logic_vector(6 downto 0);
signal zero : std_logic := '0';
signal one	: std_logic := '1';

begin
	
	nor2_1	:	nor2 port map(state_en, zero, temp(0));
	or2_1	:	or2 port map(hit_miss, temp(0), temp(1));
	nor2_2	:	nor2 port map(temp(1), zero, temp(2));
	nor2_3	:	nor2 port map(temp(5), temp(2), WEN);
	and3_1	:	and3 port map(hit_miss, rw, state_en, REN);
	or2_2	:	or2 port map(rw, temp(0), temp(5));
	nor2_4	:	nor2 port map(zero, temp(5), Valid_Data);

	and2_1	:	and2 port map(state_en, byte_offset(0), byte_out(0));
	and2_2	:	and2 port map(state_en, byte_offset(1), byte_out(1));
	
	Busy <= state_en;
	Ca_En <= zero;--state_en;
	Data_Sel <= temp(2);
	Ma_En <= zero;
	Cd_En <= zero;
	
end structural;