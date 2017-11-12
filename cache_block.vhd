library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity cache_block is
  port (
  	Reset      :  in std_logic;
    Write_data :  in std_logic_vector(7 downto 0);
    Ca_tag     :  in std_logic_vector(2 downto 0);
    Valid_data :  in std_logic;
    Byte_Enable:  in std_logic_vector(3 downto 0);
    Block_Enable: in std_logic;
    Write_en   :  in std_logic;
    Read_en    :  in std_logic;
    Read_valid_data : out std_logic;
    Read_tag_data  :  out std_logic_vector(2 downto 0);
    Read_data  :  out std_logic_vector(7 downto 0));
end cache_block;




architecture structural of cache_block is

	component and2 
		port (
			input1 : in std_logic;
			input2 : in std_logic;
			output : out std_logic);
	end component;

	component or4 
		port (
			input1 : in std_logic;
			input2 : in std_logic;
			input3 : in std_logic;
			input4 : in std_logic;
			output : out std_logic);
	end component;
	
	component cache_byte 
  		port (
 			Reset      :  in std_logic;
    		Write_data :  in std_logic_vector(7 downto 0);
		    Write_en   :  in std_logic;
		    Read_en    :  in std_logic;
		    --clk        :  in std_logic; Do not need this signal 
		    Read_data  :  out std_logic_vector(7 downto 0));
	end component;


	component Valid_tag 
  		port (
		    Reset      :  in std_logic;
		    Write_data :  in std_logic_vector(2 downto 0);
		    Valid_data :  in std_logic;
		    Write_en   :  in std_logic;
		    Read_en    :  in std_logic;
		    --clk        :  in std_logic;
		    Read_valid_data : out std_logic;
		    Read_tag_data  :  out std_logic_vector(2 downto 0));
	end component;


	component multiplex4_1 
		port (
			input0 :  in std_logic_vector(7 downto 0);  
	    	input1 :  in std_logic_vector(7 downto 0);
	    	input2 :  in std_logic_vector(7 downto 0);
	    	input3 :  in std_logic_vector(7 downto 0);
	    	en     :  in std_logic_vector(3 downto 0); 
			--en_0   :  in std_logic;
	    	--en_1   :  in std_logic;
	    	--en_2   :  in std_logic;
	    	--en_3   :  in std_logic;
	    	output :  out std_logic_vector(7 downto 0)
		);
	end component;


	for cb_0, cb_1, cb_2, cb_3 : cache_byte use entity work.cache_byte(structural);
	for and_0, and_1, and_2, and_3, and_4, and_5, and_6, and_7, and_8, and_9, and_10, and_11, and_12, and_13 : and2 use entity work.and2(structural);
	for vt_0 : Valid_tag use entity work.Valid_tag(structural);
	for multiplex_0 : multiplex4_1 use entity work.multiplex4_1(structural);

	signal blocks_en, wen, ren : std_logic_vector(3 downto 0);
	signal cbo_0, cbo_1, cbo_2, cbo_3 : std_logic_vector(7 downto 0);
	signal vt_wen, vt_ren : std_logic;

begin

	and_0 : and2 port map(Byte_Enable(0), Block_Enable, blocks_en(0));
	and_1 : and2 port map(Byte_Enable(1), Block_Enable, blocks_en(1));
	and_2 : and2 port map(Byte_Enable(2), Block_Enable, blocks_en(2));
	and_3 : and2 port map(Byte_Enable(3), Block_Enable, blocks_en(3));

	and_4 : and2 port map(blocks_en(0), Read_en, ren(0));
	and_5 : and2 port map(blocks_en(1), Read_en, ren(1));
	and_6 : and2 port map(blocks_en(2), Read_en, ren(2));
	and_7 : and2 port map(blocks_en(3), Read_en, ren(3));

	and_8 : and2 port map(blocks_en(0), Write_en, wen(0));
	and_9 : and2 port map(blocks_en(1), Write_en, wen(1));
	and_10: and2 port map(blocks_en(2), Write_en, wen(2));
	and_11: and2 port map(blocks_en(3), Write_en, wen(3));

	and_12: and2 port map(Block_Enable, Read_en, vt_ren);
	and_13: and2 port map(Block_Enable, Write_en,vt_wen);



	--------------------------------------------------------------------
	-- ren(0-3) and wen(0-3) will contain the enable for each block respectivly
	-- vt_ren and vt_wen will contain the ebale for the valid/tag for that block as well
	--------------------------------------------------------------------



	vt_0  : Valid_tag port map(Reset, Ca_tag, Valid_data, vt_wen, vt_ren, Read_valid_data, Read_tag_data);

	cb_0  : cache_byte port map(Reset, Write_data, wen(0), ren(0), cbo_0);
	cb_1  : cache_byte port map(Reset, Write_data, wen(1), ren(1), cbo_1);
	cb_2  : cache_byte port map(Reset, Write_data, wen(2), ren(2), cbo_2);
	cb_3  : cache_byte port map(Reset, Write_data, wen(3), ren(3), cbo_3);

	--------------------------------------------------------------------
	-- Where the output is sent for each bloc. Valid/Tag does not need multiplexing because they are the only value in that block
	--------------------------------------------------------------------
	
	-- multiplex_0 : multiplex4_1 port map(cbo_0, cbo_1, cbo_2, cbo_3, ren(0), ren(1), ren(2), ren(3), Read_data);
	multiplex_0 : multiplex4_1 port map(cbo_0, cbo_1, cbo_2, cbo_3, ren, Read_data);

end structural;