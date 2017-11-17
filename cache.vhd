library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity cache is
  port (
	Ca		: in std_logic_vector(7 downto 0);
	Write_data : in std_logic_vector(7 downto 0);
	RE		: in std_logic;
	WE		: in std_logic;
	Valid_data : in std_logic;
	Reset 	: in std_logic;
	
	Output	: out std_logic_vector(7 downto 0);
	Hit_Miss_Signal : out std_logic);
end cache;


architecture structural of cache is


	component cache_block
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
	end component;
	
	component Byte_Decoder
		port (
			Byte_Offset  : in std_logic_vector(1 downto 0);
			Output 		 : out std_logic_vector(3 downto 0)
		);
	end component;
	
	component hit_miss 
		port (
			input1 : in std_logic_vector(2 downto 0);
			input2 : in std_logic_vector(2 downto 0);
			valid  : in std_logic;
			output : out std_logic
		);
	end component;

	component Block_Decoder
		port (
			Block_Offset : in std_logic_vector(2 downto 0);
			Output 		 : out std_logic_vector(7 downto 0)
		);
	end component;
	
	component multiplex8_1
		port (
			input0 :  in std_logic_vector(7 downto 0);  
			input1 :  in std_logic_vector(7 downto 0);
			input2 :  in std_logic_vector(7 downto 0);
			input3 :  in std_logic_vector(7 downto 0);
			input4 :  in std_logic_vector(7 downto 0);
			input5 :  in std_logic_vector(7 downto 0);
			input6 :  in std_logic_vector(7 downto 0);
			input7 :  in std_logic_vector(7 downto 0);
			Block_Decoder_En  :  in std_logic_vector(7 downto 0);
			Output :  out std_logic_vector(7 downto 0)
		);
	end component;
	
	component hit_multiplex4_1
		port (
			input0 :  in std_logic_vector(3 downto 0);  
			input1 :  in std_logic_vector(3 downto 0);
			input2 :  in std_logic_vector(3 downto 0);
			input3 :  in std_logic_vector(3 downto 0);
			
			input4 :  in std_logic_vector(3 downto 0);
			input5 :  in std_logic_vector(3 downto 0);
			input6 :  in std_logic_vector(3 downto 0);
			input7 :  in std_logic_vector(3 downto 0);
			
			en     :  in std_logic_vector(7 downto 0);
			output :  out std_logic_vector(3 downto 0)
		);
	end component;

	
	
	for block_0, block_1, block_2, block_3, block_4, block_5, block_6, block_7 : cache_block use entity work.cache_block(structural);
	for Byte_Decoder_0 : Byte_Decoder use entity work.Byte_Decoder(structural);
	for Block_Decoder_0 : Block_Decoder use entity work.Block_Decoder(structural);
	for multiplex8_1_0 : multiplex8_1 use entity work.multiplex8_1(structural);
	for hit_multiplex4_1_0 : hit_multiplex4_1 use entity work.hit_multiplex4_1(structural);
	for hit_miss_0 : hit_miss use entity work.hit_miss(structural);
	
	signal block_en : std_logic_vector(7 downto 0);
	
	type cache_data is array (0 to 7) of std_logic_vector(7 downto 0);
	signal Read_Data_Temp : cache_data;
	
	type Read_Tag is array (0 to 7) of std_logic_vector(3 downto 0);
	signal Read_Tag_Hit_Temp : Read_Tag;
	signal byte_en, Hit_Tag_Out : std_logic_vector(3 downto 0);
	--signal Read_Valid_Temp : std_logic_vector(7 downto 0);
	
	
begin
	
	--                                       input(2-0)  output(7-0)
	Block_Decoder_0 : Block_Decoder port map(Ca(4 downto 2), block_en);
	--                                       input(1-0)  output(3-0)
	Byte_Decoder_0  : Byte_Decoder port map(Ca(1 downto 0), byte_en);
	
	-- cache Block's and their signals
	--                             Reset,         WD,         Ca_tag,         VD,    Byte_En,    Block_En, W_En, R_En,          R_VD,     R_Tag, R_D
	block_0 : cache_block port map(Reset, Write_data, Ca(7 downto 5), Valid_data, byte_en, block_en(0),   WE,   RE, Read_Tag_Hit_Temp(0)(0), Read_Tag_Hit_Temp(0)(3 downto 1), Read_Data_Temp(0));
	block_1 : cache_block port map(Reset, Write_data, Ca(7 downto 5), Valid_data, byte_en, block_en(1),   WE,   RE, Read_Tag_Hit_Temp(1)(0), Read_Tag_Hit_Temp(1)(3 downto 1), Read_Data_Temp(1));
	block_2 : cache_block port map(Reset, Write_data, Ca(7 downto 5), Valid_data, byte_en, block_en(2),   WE,   RE, Read_Tag_Hit_Temp(2)(0), Read_Tag_Hit_Temp(2)(3 downto 1), Read_Data_Temp(2));
	block_3 : cache_block port map(Reset, Write_data, Ca(7 downto 5), Valid_data, byte_en, block_en(3),   WE,   RE, Read_Tag_Hit_Temp(3)(0), Read_Tag_Hit_Temp(3)(3 downto 1), Read_Data_Temp(3));
	block_4 : cache_block port map(Reset, Write_data, Ca(7 downto 5), Valid_data, byte_en, block_en(4),   WE,   RE, Read_Tag_Hit_Temp(4)(0), Read_Tag_Hit_Temp(4)(3 downto 1), Read_Data_Temp(4));
	block_5 : cache_block port map(Reset, Write_data, Ca(7 downto 5), Valid_data, byte_en, block_en(5),   WE,   RE, Read_Tag_Hit_Temp(5)(0), Read_Tag_Hit_Temp(5)(3 downto 1), Read_Data_Temp(5));
	block_6 : cache_block port map(Reset, Write_data, Ca(7 downto 5), Valid_data, byte_en, block_en(6),   WE,   RE, Read_Tag_Hit_Temp(6)(0), Read_Tag_Hit_Temp(6)(3 downto 1), Read_Data_Temp(6));
	block_7 : cache_block port map(Reset, Write_data, Ca(7 downto 5), Valid_data, byte_en, block_en(7),   WE,   RE, Read_Tag_Hit_Temp(7)(0), Read_Tag_Hit_Temp(7)(3 downto 1), Read_Data_Temp(7));
	
	multiplex8_1_0 : multiplex8_1 port map(Read_Data_Temp(0), Read_Data_Temp(1), Read_Data_Temp(2), Read_Data_Temp(3), Read_Data_Temp(4), Read_Data_Temp(5), Read_Data_Temp(6), Read_Data_Temp(7), block_en, Output);

	hit_multiplex4_1_0 : hit_multiplex4_1 port map( Read_Tag_Hit_Temp(0), Read_Tag_Hit_Temp(1), Read_Tag_Hit_Temp(2), Read_Tag_Hit_Temp(3), Read_Tag_Hit_Temp(4), Read_Tag_Hit_Temp(5), Read_Tag_Hit_Temp(6), Read_Tag_Hit_Temp(7), block_en, Hit_Tag_Out  );
	
	hit_miss_0 : hit_miss port map(Ca(7 downto 5), Hit_Tag_Out(3 downto 1), Hit_Tag_Out(0),  Hit_Miss_Signal);
	
	
	

end structural;