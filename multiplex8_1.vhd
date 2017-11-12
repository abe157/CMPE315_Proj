library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity multiplex8_1 is
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
end multiplex8_1;

architecture structural of multiplex8_1 is

	component and2 
		port (
			input1 : in std_logic;
			input2 : in std_logic;
			output : out std_logic);
	end component;

	component or8
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
	end component;

	component inv
		port (
			input    : in  std_logic;
			output   : out std_logic);
	end component;

	
	for and2_00, and2_01, and2_02, and2_03, and2_04, and2_05, and2_06, and2_07 :and2 use entity work.and2(structural);
	for and2_10, and2_11, and2_12, and2_13, and2_14, and2_15, and2_16, and2_17 :and2 use entity work.and2(structural);
	for and2_20, and2_21, and2_22, and2_23, and2_24, and2_25, and2_26, and2_27 :and2 use entity work.and2(structural);
	for and2_30, and2_31, and2_32, and2_33, and2_34, and2_35, and2_36, and2_37 :and2 use entity work.and2(structural);
	for and2_40, and2_41, and2_42, and2_43, and2_44, and2_45, and2_46, and2_47 :and2 use entity work.and2(structural);
	for and2_50, and2_51, and2_52, and2_53, and2_54, and2_55, and2_56, and2_57 :and2 use entity work.and2(structural);
	for and2_60, and2_61, and2_62, and2_63, and2_64, and2_65, and2_66, and2_67 :and2 use entity work.and2(structural);
	for and2_70, and2_71, and2_72, and2_73, and2_74, and2_75, and2_76, and2_77 :and2 use entity work.and2(structural);
	
	for or8_0, or8_1, or8_2, or8_3, or8_4, or8_5, or8_6, or8_7 : or8 use entity work.or8(structural);
	
	signal 	input_en_0, input_en_1, input_en_2, input_en_3, input_en_4, input_en_5, input_en_6, input_en_7 : std_logic_vector(7 downto 0);

begin

	
	and2_00  :  and2 port map(input0(0),Block_Decoder_En(0),input_en_0(0));
	and2_01  :  and2 port map(input0(1),Block_Decoder_En(0),input_en_0(1));
	and2_02  :  and2 port map(input0(2),Block_Decoder_En(0),input_en_0(2));
	and2_03  :  and2 port map(input0(3),Block_Decoder_En(0),input_en_0(3));
	and2_04  :  and2 port map(input0(4),Block_Decoder_En(0),input_en_0(4));
	and2_05  :  and2 port map(input0(5),Block_Decoder_En(0),input_en_0(5));
	and2_06  :  and2 port map(input0(6),Block_Decoder_En(0),input_en_0(6));
	and2_07  :  and2 port map(input0(7),Block_Decoder_En(0),input_en_0(7));

	and2_10  :  and2 port map(input1(0),Block_Decoder_En(1),input_en_1(0));
	and2_11  :  and2 port map(input1(1),Block_Decoder_En(1),input_en_1(1));
	and2_12  :  and2 port map(input1(2),Block_Decoder_En(1),input_en_1(2));
	and2_13  :  and2 port map(input1(3),Block_Decoder_En(1),input_en_1(3));
	and2_14  :  and2 port map(input1(4),Block_Decoder_En(1),input_en_1(4));
	and2_15  :  and2 port map(input1(5),Block_Decoder_En(1),input_en_1(5));
	and2_16  :  and2 port map(input1(6),Block_Decoder_En(1),input_en_1(6));
	and2_17  :  and2 port map(input1(7),Block_Decoder_En(1),input_en_1(7));

	and2_20  :  and2 port map(input2(0),Block_Decoder_En(2),input_en_2(0));
	and2_21  :  and2 port map(input2(1),Block_Decoder_En(2),input_en_2(1));
	and2_22  :  and2 port map(input2(2),Block_Decoder_En(2),input_en_2(2));
	and2_23  :  and2 port map(input2(3),Block_Decoder_En(2),input_en_2(3));
	and2_24  :  and2 port map(input2(4),Block_Decoder_En(2),input_en_2(4));
	and2_25  :  and2 port map(input2(5),Block_Decoder_En(2),input_en_2(5));
	and2_26  :  and2 port map(input2(6),Block_Decoder_En(2),input_en_2(6));
	and2_27  :  and2 port map(input2(7),Block_Decoder_En(2),input_en_2(7));

	and2_30  :  and2 port map(input3(0),Block_Decoder_En(3),input_en_3(0));
	and2_31  :  and2 port map(input3(1),Block_Decoder_En(3),input_en_3(1));
	and2_32  :  and2 port map(input3(2),Block_Decoder_En(3),input_en_3(2));
	and2_33  :  and2 port map(input3(3),Block_Decoder_En(3),input_en_3(3));
	and2_34  :  and2 port map(input3(4),Block_Decoder_En(3),input_en_3(4));
	and2_35  :  and2 port map(input3(5),Block_Decoder_En(3),input_en_3(5));
	and2_36  :  and2 port map(input3(6),Block_Decoder_En(3),input_en_3(6));
	and2_37  :  and2 port map(input3(7),Block_Decoder_En(3),input_en_3(7));

	and2_40  :  and2 port map(input4(0),Block_Decoder_En(4),input_en_4(0));
	and2_41  :  and2 port map(input4(1),Block_Decoder_En(4),input_en_4(1));
	and2_42  :  and2 port map(input4(2),Block_Decoder_En(4),input_en_4(2));
	and2_43  :  and2 port map(input4(3),Block_Decoder_En(4),input_en_4(3));
	and2_44  :  and2 port map(input4(4),Block_Decoder_En(4),input_en_4(4));
	and2_45  :  and2 port map(input4(5),Block_Decoder_En(4),input_en_4(5));
	and2_46  :  and2 port map(input4(6),Block_Decoder_En(4),input_en_4(6));
	and2_47  :  and2 port map(input4(7),Block_Decoder_En(4),input_en_4(7));

	and2_50  :  and2 port map(input5(0),Block_Decoder_En(5),input_en_5(0));
	and2_51  :  and2 port map(input5(1),Block_Decoder_En(5),input_en_5(1));
	and2_52  :  and2 port map(input5(2),Block_Decoder_En(5),input_en_5(2));
	and2_53  :  and2 port map(input5(3),Block_Decoder_En(5),input_en_5(3));
	and2_54  :  and2 port map(input5(4),Block_Decoder_En(5),input_en_5(4));
	and2_55  :  and2 port map(input5(5),Block_Decoder_En(5),input_en_5(5));
	and2_56  :  and2 port map(input5(6),Block_Decoder_En(5),input_en_5(6));
	and2_57  :  and2 port map(input5(7),Block_Decoder_En(5),input_en_5(7));

	and2_60  :  and2 port map(input6(0),Block_Decoder_En(6),input_en_6(0));
	and2_61  :  and2 port map(input6(1),Block_Decoder_En(6),input_en_6(1));
	and2_62  :  and2 port map(input6(2),Block_Decoder_En(6),input_en_6(2));
	and2_63  :  and2 port map(input6(3),Block_Decoder_En(6),input_en_6(3));
	and2_64  :  and2 port map(input6(4),Block_Decoder_En(6),input_en_6(4));
	and2_65  :  and2 port map(input6(5),Block_Decoder_En(6),input_en_6(5));
	and2_66  :  and2 port map(input6(6),Block_Decoder_En(6),input_en_6(6));
	and2_67  :  and2 port map(input6(7),Block_Decoder_En(6),input_en_6(7));

	and2_70  :  and2 port map(input7(0),Block_Decoder_En(7),input_en_7(0));
	and2_71  :  and2 port map(input7(0),Block_Decoder_En(7),input_en_7(1));
	and2_72  :  and2 port map(input7(0),Block_Decoder_En(7),input_en_7(2));
	and2_73  :  and2 port map(input7(0),Block_Decoder_En(7),input_en_7(3));
	and2_74  :  and2 port map(input7(0),Block_Decoder_En(7),input_en_7(4));
	and2_75  :  and2 port map(input7(0),Block_Decoder_En(7),input_en_7(5));
	and2_76  :  and2 port map(input7(0),Block_Decoder_En(7),input_en_7(6));
	and2_77  :  and2 port map(input7(0),Block_Decoder_En(7),input_en_7(7));
	
	
	
	or8_0  :  or8 port map(input_en_0(0),input_en_1(0),input_en_2(0),input_en_3(0),input_en_4(0),input_en_5(0),input_en_6(0),input_en_7(0),Output(0));
	or8_1  :  or8 port map(input_en_0(1),input_en_1(1),input_en_2(1),input_en_3(1),input_en_4(1),input_en_5(1),input_en_6(1),input_en_7(1),Output(1));
	or8_2  :  or8 port map(input_en_0(2),input_en_1(2),input_en_2(2),input_en_3(2),input_en_4(2),input_en_5(2),input_en_6(2),input_en_7(2),Output(2));
	or8_3  :  or8 port map(input_en_0(3),input_en_1(3),input_en_2(3),input_en_3(3),input_en_4(3),input_en_5(3),input_en_6(3),input_en_7(3),Output(3));
	or8_4  :  or8 port map(input_en_0(4),input_en_1(4),input_en_2(4),input_en_3(4),input_en_4(4),input_en_5(4),input_en_6(4),input_en_7(4),Output(4));
	or8_5  :  or8 port map(input_en_0(5),input_en_1(5),input_en_2(5),input_en_3(5),input_en_4(5),input_en_5(5),input_en_6(5),input_en_7(5),Output(5));
	or8_6  :  or8 port map(input_en_0(6),input_en_1(6),input_en_2(6),input_en_3(6),input_en_4(6),input_en_5(6),input_en_6(6),input_en_7(6),Output(6));
	or8_7  :  or8 port map(input_en_0(7),input_en_1(7),input_en_2(7),input_en_3(7),input_en_4(7),input_en_5(7),input_en_6(7),input_en_7(7),Output(7));
	
end structural;

