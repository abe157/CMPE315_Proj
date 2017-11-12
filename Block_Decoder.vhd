library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity Block_Decoder is
  port (
    Block_Offset : in std_logic_vector(2 downto 0);
	Output 		 : out std_logic_vector(7 downto 0));
end Block_Decoder;

architecture structural of Block_Decoder is

	component and3 
		port (
			input1 : in std_logic;
			input2 : in std_logic;
			input3 : in std_logic;
			output : out std_logic);
	end component;
	
	component inv
		port (
			input    : in  std_logic;
			output   : out std_logic);
	end component;

	for inv_0, inv_1, inv_2 : inv use entity work.inv(structural);
	for and3_0, and3_1, and3_2, and3_3, and3_4, and3_5, and3_6, and3_7 : and3 use entity work.and3(structural);	
	signal Block_Offset_Bar : std_logic_vector(2 downto 0);
	
begin
	
	inv_0 : inv port map(Block_Offset(0), Block_Offset_Bar(0));
	inv_1 : inv port map(Block_Offset(1), Block_Offset_Bar(1));
	inv_2 : inv port map(Block_Offset(2), Block_Offset_Bar(2));
	
	and3_0  : and3 port map(Block_Offset_Bar(0), Block_Offset_Bar(1), Block_Offset_Bar(2), Output(0));
	and3_1  : and3 port map(Block_Offset(0), Block_Offset_Bar(1), Block_Offset_Bar(2), Output(1));
	and3_2  : and3 port map(Block_Offset_Bar(0), Block_Offset(1), Block_Offset_Bar(2), Output(2));
	and3_3  : and3 port map(Block_Offset(0), Block_Offset(1), Block_Offset_Bar(2), Output(3));
	and3_4  : and3 port map(Block_Offset_Bar(0), Block_Offset_Bar(1), Block_Offset(2), Output(4));
	and3_5  : and3 port map(Block_Offset(0), Block_Offset_Bar(1), Block_Offset(2), Output(5));
	and3_6  : and3 port map(Block_Offset_Bar(0), Block_Offset(1), Block_Offset(2), Output(6));
	and3_7  : and3 port map(Block_Offset(0), Block_Offset(1), Block_Offset(2), Output(7));
	
end structural;