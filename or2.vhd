--
-- Entity: or2
-- Architecture : structural
-- Author: Abenezer Wudenhe (a157@umbc.edu)
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;
entity or2 is

port (
input1 : in std_logic;
input2 : in std_logic;
output : out std_logic);
end or2;
architecture structural of or2 is
begin
output <= input2 or input1;
end structural;

--------------------------------------------------------------------------------------------------