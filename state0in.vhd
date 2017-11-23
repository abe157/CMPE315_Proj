library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity state0in is
	port (
		state_en	: in std_logic;
		reset		: in std_logic;
		start		: in std_logic;
		
		Reset_st	: out std_logic;
		Next_st		: out std_logic);
end state0in;

architecture structural of state0in is

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
--for or2_1	:	or2 use entity work.or2(structural);

signal nreset, nstart, next_1, next_2	: std_logic;

begin

	inv_1	:	inv port map(reset, nreset);
	inv_2	: 	inv port map(start, nstart);
	and2_1	:	and2 port map(reset, state_en, Reset_st);
	and3_1	:	and3 port map(nreset, state_en, start, Next_st);
	and2_2	:	and2 port map(nstart, nreset, next_2);
	--or2_1	:	or2  port map(next_1, next_2, Next_st);


end structural;