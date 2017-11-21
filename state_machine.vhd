
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

	component or19
		port (
			input1 : in std_logic;
			input2 : in std_logic;
			input3 : in std_logic;
			input4 : in std_logic;
			input5 : in std_logic;
			input6 : in std_logic;
			input7 : in std_logic;
			input8 : in std_logic;
			input9 : in std_logic;
			input10 : in std_logic;
			input11 : in std_logic;
			input12 : in std_logic;
			input13 : in std_logic;
			input14 : in std_logic;
			input15 : in std_logic;
			input16 : in std_logic;
			input17 : in std_logic;
			input18 : in std_logic;
			input19 : in std_logic;
			output : out std_logic);
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
	
	component state1out
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
	for or19_0, or19_1, or19_2, or19_3, or19_4, or19_5, or19_6, or19_7 :or19 use entity work.or19(structural);
	--for or3_1	:	or3 use entity work.or3(structural);
	for and2_1	:	and2 use entity work.and2(structural);
	
	for st0out	:	state0out use entity work.state0out(structural);
	for st1out	:	state1out use entity work.state1out(structural);
	
	signal state, nstate, ResetState, NextState  : std_logic_vector(18 downto 0);
	signal maen, cden, datasel, readen, writeen, validData, cachereset, buzy : std_logic_vector(18 downto 0);
	
	signal one	:	std_logic := '1';
	signal zero	:	std_logic := '0';
	signal nreset, nclk, full_reset, temp_next, full_next : 	std_logic;
	
begin
	
	--Inverted Signals
	inv1	:	inv port map(Reset, nreset);
	inv2	:	inv port map(clk, nclk);
	
	--State Input Hanlders
	st0in : state0in port map(state(0), Reset, Start, ResetState(0), NextState(0));
	
	--All states combined reset_state & next_state signal or20
	or2_1	: or2 port map(Reset, ResetState(0), full_reset);
	or2_2	: or2 port map(Reset, NextState(0), temp_next);
	
	
	--Combine the change state with the clk 
	and2_1	: and2 port map(temp_next, nclk, full_next);
	
	--Shift register that handless the increment of the states
	sr : shift_reg20 port map(full_reset, full_next, state, nstate);
		
	--State output signal handelers
	st0out : state0out port map(state(0), maen(0), cden(0), datasel(0), readen(0), writeen(0), validData(0), cachereset(0), buzy(0));
	st1out : state1out port map(state(2), maen(1), cden(1), datasel(1), readen(1), writeen(1), validData(1), cachereset(1), buzy(1));
	
	--Handling the outputs to a single variable	-- "maen(1), maen(1), maen(1), maen(1),maen(1), maen(1), maen(1), maen(1), maen(1), maen(1), maen(1), maen(1), maen(1), maen(1), maen(1), maen(1), maen(1), maen(1), maen(1)"
	or19_0  :  or19 port map(maen(0), maen(1), maen(2), maen(3),maen(4), maen(5), maen(6), maen(7), maen(8), maen(9), maen(10), maen(11), maen(12), maen(13), maen(14), maen(15), maen(16), maen(17), maen(18), Ma_En);
	or19_1  :  or19 port map(cden(0), cden(1), cden(2), cden(3),cden(4), cden(5), cden(6), cden(7), cden(8), cden(9), cden(10), cden(11), cden(12), cden(13), cden(14), cden(15), cden(16), cden(17), cden(18), Cd_En);
	or19_2  :  or19 port map(datasel(0), datasel(1), datasel(2), datasel(3),datasel(4), datasel(5), datasel(6), datasel(7), datasel(8), datasel(9), datasel(10), datasel(11), datasel(12), datasel(13), datasel(14), datasel(15), datasel(16), datasel(17), datasel(18), Data_Sel);
	or19_3  :  or19 port map(readen(0), readen(1), readen(2), readen(3),readen(4), readen(5), readen(6), readen(7), readen(8), readen(9), readen(10), readen(11), readen(12), readen(13), readen(14), readen(15), readen(16), readen(17), readen(18), REN);
	or19_4  :  or19 port map(writeen(0), writeen(1), writeen(2), writeen(3),writeen(4), writeen(5), writeen(6), writeen(7), writeen(8), writeen(9), writeen(10), writeen(11), writeen(12), writeen(13), writeen(14), writeen(15), writeen(16), writeen(17), writeen(18), WEN);
	or19_5  :  or19 port map(validData(0), validData(1), validData(2), validData(3),validData(4), validData(5), validData(6), validData(7), validData(8), validData(9), validData(10), validData(11), validData(12), validData(13), validData(14), validData(15), validData(16), validData(17), validData(18), Valid_Data);
	or19_6  :  or19 port map(cachereset(0), cachereset(1), cachereset(2), cachereset(3),cachereset(4), cachereset(5), cachereset(6), cachereset(7), cachereset(8), cachereset(9), cachereset(10), cachereset(11), cachereset(12), cachereset(13), cachereset(14), cachereset(15), cachereset(16), cachereset(17), cachereset(18), Cache_Reset);              
	or19_7  :  or19 port map(buzy(0), buzy(1), buzy(2), buzy(3),buzy(4), buzy(5), buzy(6), buzy(7), buzy(8), buzy(9), buzy(10), buzy(11), buzy(12), buzy(13), buzy(14), buzy(15), buzy(16), buzy(17), buzy(18), Busy);
	

	
	Ma(4 downto 0) <= state(4 downto 0);
	Ma(7) <= temp_next;
	Ma(6) <= NextState(0);
	--Ca <= nstate(7 downto 0);
	

end structural;