library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity Byte_Decoder is
  port (
    Byte_Offset  : in std_logic_vector(1 downto 0);
	Output 		 : out std_logic_vector(3 downto 0));
end Byte_Decoder;

architecture structural of Byte_Decoder is

	component and2 
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

	for inv_0, inv_1 : inv use entity work.inv(structural);
	for and2_0, and2_1, and2_2, and2_3 : and2 use entity work.and2(structural);
	signal Byte_Offset_Bar : std_logic_vector(1 downto 0);

begin

	inv_0 : inv port map(Byte_Offset(0), Byte_Offset_Bar(0));
	inv_1 : inv port map(Byte_Offset(1), Byte_Offset_Bar(1));

	and2_0  : and2 port map(Byte_Offset_Bar(0), Byte_Offset_Bar(1), Output(0));	-- 00
	and2_1  : and2 port map(Byte_Offset(0), Byte_Offset_Bar(1), Output(1));		-- 01
	and2_2  : and2 port map(Byte_Offset_Bar(0), Byte_Offset(1), Output(2));		-- 10
	and2_3  : and2 port map(Byte_Offset(0), Byte_Offset(1), Output(3));			-- 11

end structural;