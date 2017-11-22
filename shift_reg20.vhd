library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity shift_reg20 is
	port (
		reset	:  in std_logic;
		clk		:  in std_logic;
		q		:  out std_logic_vector(19 downto 0);
		qbar	:  out std_logic_vector(19 downto 0));
end shift_reg20;

architecture structural of shift_reg20 is
	component shift_reg
	  port (
		d   	: in  std_logic;
		clk 	: in  std_logic;
		reset	: in  std_logic;
		q   	: out std_logic;
		qbar	: out std_logic); 
	end component;
	
	component inv
	  port (
		input    : in  std_logic;
		output   : out std_logic);
	end component;
	
	component or2
		port (
		input1 : in std_logic;
		input2 : in std_logic;
		output : out std_logic);
	end component;

	for shift_reg_1, shift_reg_2, shift_reg_3, shift_reg_4, shift_reg_5, shift_reg_6, shift_reg_7, shift_reg_8, shift_reg_9, shift_reg_10, 
		shift_reg_11, shift_reg_12, shift_reg_13, shift_reg_14, shift_reg_15, shift_reg_16, shift_reg_17, shift_reg_18, shift_reg_19, shift_reg_20	:  shift_reg use entity work.shift_reg(structural);
	
	for inv_1		:  inv use entity work.inv(structural);
	for or2_1, or2_2		: or2 use entity work.or2(structural);
	
	signal temp		:  std_logic_vector(19 downto 0);
	signal ntemp	:  std_logic_vector(19 downto 0);
	signal nreset	:  std_logic;
	signal zero     :  std_logic := '0';
	signal one     :  std_logic := '1';
	signal resetclk, reg1D	:  std_logic;
	
	begin
		inv_1	:  inv port map(reset, nreset);
		or2_1	:  or2 port map(reset, clk, resetclk);
		or2_2	:	or2 port map(reset, temp(19), reg1D);
		

		shift_reg_1	:  shift_reg port map (reg1D, clk, zero, temp(0), ntemp(0));
		shift_reg_2	:  shift_reg port map (temp(0), clk, reset, temp(1), ntemp(1));
		shift_reg_3	:  shift_reg port map (temp(1), clk, reset, temp(2), ntemp(2));
		shift_reg_4	:  shift_reg port map (temp(2), clk, reset, temp(3), ntemp(3));
		shift_reg_5	:  shift_reg port map (temp(3), clk, reset, temp(4), ntemp(4));
		shift_reg_6	:  shift_reg port map (temp(4), clk, reset, temp(5), ntemp(5));
		shift_reg_7	:  shift_reg port map (temp(5), clk, reset, temp(6), ntemp(6));
		shift_reg_8	:  shift_reg port map (temp(6), clk, reset, temp(7), ntemp(7));
		shift_reg_9	:  shift_reg port map (temp(7), clk, reset, temp(8), ntemp(8));
		shift_reg_10	:  shift_reg port map (temp(8), clk, reset, temp(9), ntemp(9));
		shift_reg_11	:  shift_reg port map (temp(9), clk, reset, temp(10), ntemp(10));
		shift_reg_12	:  shift_reg port map (temp(10), clk, reset, temp(11), ntemp(11));
		shift_reg_13	:  shift_reg port map (temp(11), clk, reset, temp(12), ntemp(12));
		shift_reg_14	:  shift_reg port map (temp(12), clk, reset, temp(13), ntemp(13));
		shift_reg_15	:  shift_reg port map (temp(13), clk, reset, temp(14), ntemp(14));
		shift_reg_16	:  shift_reg port map (temp(14), clk, reset, temp(15), ntemp(15));
		shift_reg_17	:  shift_reg port map (temp(15), clk, reset, temp(16), ntemp(16));
		shift_reg_18	:  shift_reg port map (temp(16), clk, reset, temp(17), ntemp(17));
		shift_reg_19	:  shift_reg port map (temp(17), clk, reset, temp(18), ntemp(18));
		shift_reg_20	:  shift_reg port map (temp(18), clk, reset, temp(19), ntemp(19));
		q <= temp;
		qbar <= ntemp;

end structural;