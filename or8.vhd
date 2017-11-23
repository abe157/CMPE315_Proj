
library STD;
library IEEE;
use IEEE.std_logic_1164.all;
entity or8 is
port (
	input1 : in std_logic;
	input2 : in std_logic;
	input3 : in std_logic;
	input4 : in std_logic;
	input5 : in std_logic;
	input6 : in std_logic;
	input7 : in std_logic;
	input8 : in std_logic;
	output : out std_logic);
end or8;

architecture structural of or8 is

begin
	output <= input1 or input2 or input3 or input4 or input5 or input6 or input7 or input8;
end structural;
--------------------------------------------------------------------------------------------------
