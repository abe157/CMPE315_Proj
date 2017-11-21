library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity state_machine is
  port (

		clk : in std_logic;
		Read_Write : in std_logic;
		Start : in std_logic;
		Reset : in std_logic;
		Hit_Miss : in std_logic;
		Ca : in std_logic_vector(7 downto 0);

		Ma : out std_logic_vector(7 downto 0);
		Ma_En : out std_logic;
		Cd_En : out std_logic;
		Data_Sel : out std_logic;
		REN : out std_logic;
		WEN : out std_logic;
		Valid_Data : out std_logic;
		Cache_Reset : out std_logic;
		Busy : out std_logic);
end state_machine;


architecture structural of state_machine is

	component inv
	  port (
		input    : in  std_logic;
		output   : out std_logic);
	end component;

	component shift_reg20
		port (
			reset	:  in std_logic;
			clk		:  in std_logic;
			q		:  out std_logic_vector(18 downto 0);
			qbar	:  out std_logic_vector(18 downto 0));
	end component;
	
	component state0out
	port (
		state_en	: in std_logic;
		
		Ma_En : out std_logic;
		Cd_En : out std_logic;
		Data_Sel : out std_logic;
		REN : out std_logic;
		WEN : out std_logic;
		Valid_Data : out std_logic;
		Cache_Reset : out std_logic;
		Busy : out std_logic);
	end component;
	
	component state0in
		port (
			state_en	: in std_logic;
			reset		: in std_logic;
			start		: in std_logic;
			
			Reset_st	: out std_logic;
			Next_st		: out std_logic);
	end component;
	
	component or3 
		port (
		input1 : in std_logic;
		input2 : in std_logic;
		input3 : in std_logic;
		output : out std_logic);
	end component;
	
	component or2 
		port (
		input1 : in std_logic;
		input2 : in std_logic;
		output : out std_logic);
	end component;
	
	component and2
	  port (
		input1   : in  std_logic;
		input2   : in  std_logic;
		output   : out std_logic);
	end component;
	
	for st0in : state0in use entity work.state0in(structural);
	for sr : shift_reg20 use entity work.shift_reg20(structural);
	for inv1, inv2 : inv use entity work.inv(structural);
	for or2_1, or2_2	:	or2 use entity work.or2(structural);
	--for or3_1	:	or3 use entity work.or3(structural);
	for and2_1	:	and2 use entity work.and2(structural);
	
	for st0out : state0out use entity work.state0out(structural);
	
	signal state, nstate, ResetState, NextState  : std_logic_vector(18 downto 0);
	signal one	:	std_logic := '1';
	signal zero	:	std_logic := '0';
	signal nreset, nclk, full_reset, temp_next, full_next : 	std_logic;
	
begin
	
	--Inverted Signals
	inv1	:	inv port map(Reset, nreset);
	inv2	:	inv port map(clk, nclk);
	
	st0in : state0in port map(state(0), Reset, Start, ResetState(0), NextState(0));
	
	--All states combined reset_state & next_state signal or20
	or2_1	: or2 port map(Reset, ResetState(0), full_reset);
	or2_2	: or2 port map(Reset, NextState(0), temp_next);
	
	
	--Combine the change state with the clk 
	and2_1	: and2 port map(temp_next, nclk, full_next);
	
	--Shift register that handless the increment of the states
	sr : shift_reg20 port map(full_reset, full_next, state, nstate);
		
	--State output signal handelers
	st0out : state0out port map(state(2), Ma_En, Cd_En, Data_Sel, REN, WEN, Valid_Data, Cache_Reset, Busy);

	Ma(4 downto 0) <= state(4 downto 0);
	Ma(7) <= temp_next;
	Ma(6) <= NextState(0);
	--Ca <= nstate(7 downto 0);
	

end structural;