library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity hit_multiplex4_1 is
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
end hit_multiplex4_1;

architecture structural of hit_multiplex4_1 is

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

	for and2_00, and2_01, and2_02, and2_03 :and2 use entity work.and2(structural);
	for and2_10, and2_11, and2_12, and2_13 :and2 use entity work.and2(structural);
	for and2_20, and2_21, and2_22, and2_23 :and2 use entity work.and2(structural);
	for and2_30, and2_31, and2_32, and2_33 :and2 use entity work.and2(structural);
	for and2_40, and2_41, and2_42, and2_43 :and2 use entity work.and2(structural);
	for and2_50, and2_51, and2_52, and2_53 :and2 use entity work.and2(structural);
	for and2_60, and2_61, and2_62, and2_63 :and2 use entity work.and2(structural);
	for and2_70, and2_71, and2_72, and2_73 :and2 use entity work.and2(structural);

	for or8_0, or8_1, or8_2, or8_3 : or8 use entity work.or8(structural);

	signal and_out_0, and_out_1, and_out_2, and_out_3, and_out_4, and_out_5, and_out_6, and_out_7 : std_logic_vector(7 downto 0);

begin

	and2_00 : and2 port map(input0(0), en(0), and_out_0(0));
	and2_01 : and2 port map(input0(1), en(0), and_out_0(1));
	and2_02 : and2 port map(input0(2), en(0), and_out_0(2));
	and2_03 : and2 port map(input0(3), en(0), and_out_0(3));


	and2_10 : and2 port map(input1(0), en(1), and_out_1(0));
	and2_11 : and2 port map(input1(1), en(1), and_out_1(1));
	and2_12 : and2 port map(input1(2), en(1), and_out_1(2));
	and2_13 : and2 port map(input1(3), en(1), and_out_1(3));



	and2_20 : and2 port map(input2(0), en(2), and_out_2(0));
	and2_21 : and2 port map(input2(1), en(2), and_out_2(1));
	and2_22 : and2 port map(input2(2), en(2), and_out_2(2));
	and2_23 : and2 port map(input2(3), en(2), and_out_2(3));



	and2_30 : and2 port map(input3(0), en(3), and_out_3(0));
	and2_31 : and2 port map(input3(1), en(3), and_out_3(1));
	and2_32 : and2 port map(input3(2), en(3), and_out_3(2));
	and2_33 : and2 port map(input3(3), en(3), and_out_3(3));
	
	
	----------------------------------------------------
	and2_40 : and2 port map(input4(0), en(4), and_out_4(0));
	and2_41 : and2 port map(input4(1), en(4), and_out_4(1));
	and2_42 : and2 port map(input4(2), en(4), and_out_4(2));
	and2_43 : and2 port map(input4(3), en(4), and_out_4(3));
	
	and2_50 : and2 port map(input5(0), en(5), and_out_5(0));
	and2_51 : and2 port map(input5(1), en(5), and_out_5(1));
	and2_52 : and2 port map(input5(2), en(5), and_out_5(2));
	and2_53 : and2 port map(input5(3), en(5), and_out_5(3));
	
	and2_60 : and2 port map(input6(0), en(6), and_out_6(0));
	and2_61 : and2 port map(input6(1), en(6), and_out_6(1));
	and2_62 : and2 port map(input6(2), en(6), and_out_6(2));
	and2_63 : and2 port map(input6(3), en(6), and_out_6(3));
	
	and2_70 : and2 port map(input7(0), en(7), and_out_7(0));
	and2_71 : and2 port map(input7(1), en(7), and_out_7(1));
	and2_72 : and2 port map(input7(2), en(7), and_out_7(2));
	and2_73 : and2 port map(input7(3), en(7), and_out_7(3));


	
	or8_0 : or8 port map(and_out_0(0), and_out_1(0), and_out_2(0), and_out_3(0), and_out_4(0), and_out_5(0), and_out_6(0),and_out_7(0), output(0) );
	or8_1 : or8 port map(and_out_0(1), and_out_1(1), and_out_2(1), and_out_3(1), and_out_4(1), and_out_5(1), and_out_6(1),and_out_7(1), output(1) );
	or8_2 : or8 port map(and_out_0(2), and_out_1(2), and_out_2(2), and_out_3(2), and_out_4(2), and_out_5(2), and_out_6(2),and_out_7(2), output(2) );
	or8_3 : or8 port map(and_out_0(3), and_out_1(3), and_out_2(3), and_out_3(3), and_out_4(3), and_out_5(3), and_out_6(3),and_out_7(3), output(3) );
	
	

---------------------------------------------------------------
		
	
end structural;

