library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity cache_byte is
  port (
  	Reset      :  in std_logic;
    Write_data :  in std_logic_vector(7 downto 0);
    Write_en   :  in std_logic;
    Read_en    :  in std_logic;
    --clk        :  in std_logic; clk for the dlatch acts will act as the write_en signal 
    Read_data  :  out std_logic_vector(7 downto 0));
end cache_byte;

architecture structural of cache_byte is

	component cache_bit
 		 port (
 		Reset      :  in std_logic;
    	Write_data :  in std_logic;
    	Write_en   :  in std_logic;
    	Read_en    :  in std_logic;
    	Read_data  :  out std_logic);
	end component;

	for cb_0, cb_1, cb_2, cb_3, cb_4, cb_5, cb_6, cb_7 : cache_bit use entity work.cache_bit(structural);

begin

	cb_0 : cache_bit port map(Reset, Write_data(0), Write_en, Read_en, Read_data(0));
	cb_1 : cache_bit port map(Reset, Write_data(1), Write_en, Read_en, Read_data(1));
	cb_2 : cache_bit port map(Reset, Write_data(2), Write_en, Read_en, Read_data(2));
	cb_3 : cache_bit port map(Reset, Write_data(3), Write_en, Read_en, Read_data(3));
	cb_4 : cache_bit port map(Reset, Write_data(4), Write_en, Read_en, Read_data(4));
	cb_5 : cache_bit port map(Reset, Write_data(5), Write_en, Read_en, Read_data(5));
	cb_6 : cache_bit port map(Reset, Write_data(6), Write_en, Read_en, Read_data(6));
	cb_7 : cache_bit port map(Reset, Write_data(7), Write_en, Read_en, Read_data(7));

end structural;