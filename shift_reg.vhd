library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity shift_reg is
	port (
		d   	:  in  std_logic;
		clk 	:  in  std_logic;
		reset	:  in  std_logic;
		q   	:  out std_logic;
		qbar	:  out std_logic); 
end shift_reg;

architecture structural of shift_reg is
	

	component latch			
	  port (	
		d   : in  std_logic;
		clk : in  std_logic;
		q   : out std_logic;
		qbar: out std_logic); 
	end component;
	
	component and2
	  port (
		input1   : in  std_logic;
		input2   : in  std_logic;
		output   : out std_logic);
	end component;
	
	component inv
	  port (
		input    : in  std_logic;
		output   : out std_logic);
	end component;
	
	for inv_1	:  inv use entity work.inv(structural);
	for latch_1		:  latch use entity work.latch(structural);
	for and2_1		:  and2 use entity work.and2(structural);
	
	signal nreset, tempIn	: std_logic;
	
	begin
		inv_1	:  inv port map(reset, nreset);
		and2_1		:  and2 port map(nreset, d, tempIn);
		latch_1		:  latch port map(tempIn, clk, q, qbar);
		
end structural;	









