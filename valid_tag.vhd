library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity Valid_tag is
  port (
    Reset      :  in std_logic;
    Write_data :  in std_logic_vector(2 downto 0);
    Valid_data :  in std_logic;
    Write_en   :  in std_logic;
    Read_en    :  in std_logic;
    --clk        :  in std_logic;
    Read_valid_data : out std_logic;
    Read_tag_data  :  out std_logic_vector(2 downto 0));
end Valid_tag;

architecture structural of Valid_tag is

	component cache_bit
 		 port (
        Reset      :  in std_logic;
        Write_data :  in std_logic;
        Write_en   :  in std_logic;
        Read_en    :  in std_logic;
        Read_data  :  out std_logic);
	end component;

	for valid_0, tag_0, tag_1, tag_2 : cache_bit use entity work.cache_bit(structural); 

begin

	valid_0 : cache_bit port map(Reset, Valid_data, Write_en, Read_en, Read_valid_data);

	tag_0   : cache_bit port map(Reset, Write_data(0), Write_en, Read_en, Read_tag_data(0));
	tag_1   : cache_bit port map(Reset, Write_data(1), Write_en, Read_en, Read_tag_data(1));
	tag_2   : cache_bit port map(Reset, Write_data(2), Write_en, Read_en, Read_tag_data(2));

end structural;
