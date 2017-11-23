library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity multiplex4_1 is
	port (
		input0 :  in std_logic_vector(7 downto 0);  
    	input1 :  in std_logic_vector(7 downto 0);
    	input2 :  in std_logic_vector(7 downto 0);
    	input3 :  in std_logic_vector(7 downto 0);
		en     :  in std_logic_vector(3 downto 0);
    	output :  out std_logic_vector(7 downto 0)
		);
end multiplex4_1;

architecture structural of multiplex4_1 is

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

	for and2_00, and2_01, and2_02, and2_03, and2_04, and2_05, and2_06, and2_07  : and2 use entity work.and2(structural);
	for	and2_10, and2_11, and2_12, and2_13, and2_14, and2_15, and2_16, and2_17  : and2 use entity work.and2(structural);
	for	and2_20, and2_21, and2_22, and2_23, and2_24, and2_25, and2_26, and2_27  : and2 use entity work.and2(structural);
	for	and2_30, and2_31, and2_32, and2_33, and2_34, and2_35, and2_36, and2_37  : and2 use entity work.and2(structural);

	for or4_00, or4_01, or4_02, or4_03, or4_04, or4_05, or4_06, or4_07         : or4 use entity work.or4(structural);

	signal and_out_0, and_out_1, and_out_2, and_out_3 : std_logic_vector(7 downto 0);

begin

	and2_00 : and2 port map(input0(0), en(0), and_out_0(0));
	and2_01 : and2 port map(input0(1), en(0), and_out_0(1));
	and2_02 : and2 port map(input0(2), en(0), and_out_0(2));
	and2_03 : and2 port map(input0(3), en(0), and_out_0(3));
	and2_04 : and2 port map(input0(4), en(0), and_out_0(4));
	and2_05 : and2 port map(input0(5), en(0), and_out_0(5));
	and2_06 : and2 port map(input0(6), en(0), and_out_0(6));
	and2_07 : and2 port map(input0(7), en(0), and_out_0(7));


	and2_10 : and2 port map(input1(0), en(1), and_out_1(0));
	and2_11 : and2 port map(input1(1), en(1), and_out_1(1));
	and2_12 : and2 port map(input1(2), en(1), and_out_1(2));
	and2_13 : and2 port map(input1(3), en(1), and_out_1(3));
	and2_14 : and2 port map(input1(4), en(1), and_out_1(4));
	and2_15 : and2 port map(input1(5), en(1), and_out_1(5));
	and2_16 : and2 port map(input1(6), en(1), and_out_1(6));
	and2_17 : and2 port map(input1(7), en(1), and_out_1(7));


	and2_20 : and2 port map(input2(0), en(2), and_out_2(0));
	and2_21 : and2 port map(input2(1), en(2), and_out_2(1));
	and2_22 : and2 port map(input2(2), en(2), and_out_2(2));
	and2_23 : and2 port map(input2(3), en(2), and_out_2(3));
	and2_24 : and2 port map(input2(4), en(2), and_out_2(4));
	and2_25 : and2 port map(input2(5), en(2), and_out_2(5));
	and2_26 : and2 port map(input2(6), en(2), and_out_2(6));
	and2_27 : and2 port map(input2(7), en(2), and_out_2(7));


	and2_30 : and2 port map(input3(0), en(3), and_out_3(0));
	and2_31 : and2 port map(input3(1), en(3), and_out_3(1));
	and2_32 : and2 port map(input3(2), en(3), and_out_3(2));
	and2_33 : and2 port map(input3(3), en(3), and_out_3(3));
	and2_34 : and2 port map(input3(4), en(3), and_out_3(4));
	and2_35 : and2 port map(input3(5), en(3), and_out_3(5));
	and2_36 : and2 port map(input3(6), en(3), and_out_3(6));
	and2_37 : and2 port map(input3(7), en(3), and_out_3(7));

		-- and_out_0, and_out_1, and_out_2, and_out_3 contain the output enabled from each of the 4 byte blocks

	or4_00 : or4 port map(and_out_0(0), and_out_1(0), and_out_2(0), and_out_3(0), output(0));
	or4_01 : or4 port map(and_out_0(1), and_out_1(1), and_out_2(1), and_out_3(1), output(1));
	or4_02 : or4 port map(and_out_0(2), and_out_1(2), and_out_2(2), and_out_3(2), output(2));
	or4_03 : or4 port map(and_out_0(3), and_out_1(3), and_out_2(3), and_out_3(3), output(3));
	or4_04 : or4 port map(and_out_0(4), and_out_1(4), and_out_2(4), and_out_3(4), output(4));
	or4_05 : or4 port map(and_out_0(5), and_out_1(5), and_out_2(5), and_out_3(5), output(5));
	or4_06 : or4 port map(and_out_0(6), and_out_1(6), and_out_2(6), and_out_3(6), output(6));
	or4_07 : or4 port map(and_out_0(7), and_out_1(7), and_out_2(7), and_out_3(7), output(7));

end structural;

