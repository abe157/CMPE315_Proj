library STD;
library IEEE;
use IEEE.std_logic_1164.all;
entity or19 is
port (
	input1 : in std_logic;
	input2 : in std_logic;
	input3 : in std_logic;
	input4 : in std_logic;
	input5 : in std_logic;
	input6 : in std_logic;
	input7 : in std_logic;
	input8 : in std_logic;
	input9 : in std_logic;
	input10 : in std_logic;
	input11 : in std_logic;
	input12 : in std_logic;
	input13 : in std_logic;
	input14 : in std_logic;
	input15 : in std_logic;
	input16 : in std_logic;
	input17 : in std_logic;
	input18 : in std_logic;
	input19 : in std_logic;
	output : out std_logic);
end or19;

architecture structural of or19 is

begin
	output <= input1 or input2 or input3 or input4 or input5 or input6 or input7 or input8 or input9 or input10 or input11 or input12 or input13 or input14 or input15 or input16 or input17 or input18 or input19;
end structural;
