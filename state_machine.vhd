library STD;
library IEEE;
use IEEE.std_logic_1164.all;
entity or20 is
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
	input20 : in std_logic;
	
	output : out std_logic);
end or20;

architecture structural of or20 is

begin
	output <= input1 or input2 or input3 or input4 or input5 or input6 or input7 or input8 or input9 or input10 or input11 or input12 or input13 or input14 or input15 or input16 or input17 or input18 or input19 or input20;
end structural;

library STD;
library IEEE;
use IEEE.std_logic_1164.all;
entity or21 is
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
	input20 : in std_logic;
	input21 : in std_logic;
	output : out std_logic);
end or21;

architecture structural of or21 is

begin
	output <= input1 or input2 or input3 or input4 or input5 or input6 or input7 or input8 or input9 or input10 or input11 or input12 or input13 or input14 or input15 or input16 or input17 or input18 or input19 or input20 or input21;
end structural;

library STD;
library IEEE;
use IEEE.std_logic_1164.all;
entity or12 is
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
	input10: in std_logic;
	input11: in std_logic;
	input12: in std_logic;
	
	output : out std_logic);
end or12;

architecture structural of or12 is

begin
	output <= input1 or input2 or input3 or input4 or input5 or input6 or input7 or input8 or input9 or input10 or input11 or input12;
end structural;

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
		Ca_En : out std_logic;
		Data_Sel : out std_logic;
		REN : out std_logic;
		WEN : out std_logic;
		Valid_Data : out std_logic;
		Busy : out std_logic;
		byte_out  : out std_logic_vector(1 downto 0));
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
			q		:  out std_logic_vector(19 downto 0);
			qbar	:  out std_logic_vector(19 downto 0));
	end component;
	
	component state0
		port (
			state_en	: in std_logic;
			reset		: in std_logic;
			start		: in std_logic;
			
			Reset_st	: out std_logic;
			Next_st		: out std_logic;
			Ma_En : out std_logic;
			Cd_En : out std_logic;
			Data_Sel : out std_logic;
			REN : out std_logic;
			WEN : out std_logic;
			Valid_Data : out std_logic;
			Busy : out std_logic;
			Ca_En 		: out std_logic);
	end component;
	
	component state1
		port (
			state_en	: in std_logic;
			rw			: in std_logic;
			hit_miss	: in std_logic;
			byte_offset	: in std_logic_vector(1 downto 0);
			
			Ma_En		: out std_logic;
			Cd_En		: out std_logic;
			Data_Sel 	: out std_logic;
			REN 		: out std_logic;
			WEN 		: out std_logic;
			Valid_Data 	: out std_logic;
			Busy 		: out std_logic;
			Ca_En 		: out std_logic;
			byte_out	: out std_logic_vector(1 downto 0));
		end component;

	component state2
		port (
			state_en	: in std_logic;
			rw			: in std_logic;
			hit_miss	: in std_logic;
			byte_offset	: in std_logic_vector(1 downto 0);
			
			Ma_En		: out std_logic;
			Cd_En		: out std_logic;
			Data_Sel 	: out std_logic;
			REN 		: out std_logic;
			WEN 		: out std_logic;
			Valid_Data 	: out std_logic;
			Busy 		: out std_logic;
			Ca_En 		: out std_logic;
			Reset_St	: out std_logic;
			byte_out	: out std_logic_vector(1 downto 0));
		end component;

	component state3
		port (
			state_en	: in std_logic;
			rw			: in std_logic;
			hit_miss	: in std_logic;

			Ma_En		: out std_logic;
			Cd_En		: out std_logic;
			Data_Sel 	: out std_logic;
			REN 		: out std_logic;
			WEN 		: out std_logic;
			Valid_Data 	: out std_logic;
			Busy 		: out std_logic;
			Ca_En 		: out std_logic;
			Reset_St	: out std_logic);
		end component;

	component wait_state
		port (
			state_en	: in std_logic;

			Ma_En		: out std_logic;
			Cd_En		: out std_logic;
			Data_Sel 	: out std_logic;
			REN 		: out std_logic;
			WEN 		: out std_logic;
			Valid_Data 	: out std_logic;
			Busy 		: out std_logic;
			Ca_En 		: out std_logic;
			Reset_St	: out std_logic);
		end component;
		
	component state10
		port (
			state_en	: in std_logic;

			Ma_En		: out std_logic;
			Cd_En		: out std_logic;
			Data_Sel 	: out std_logic;
			REN 		: out std_logic;
			WEN 		: out std_logic;
			Valid_Data 	: out std_logic;
			Busy 		: out std_logic;
			Ca_En 		: out std_logic;
			Reset_St	: out std_logic;
			byte_out  	: out std_logic_vector(1 downto 0));
	end component;	
		
	component state11
		port (
			state_en	: in std_logic;

			Ma_En		: out std_logic;
			Cd_En		: out std_logic;
			Data_Sel 	: out std_logic;
			REN 		: out std_logic;
			WEN 		: out std_logic;
			Valid_Data 	: out std_logic;
			Busy 		: out std_logic;
			Ca_En 		: out std_logic;
			Reset_St	: out std_logic;
			byte_out  	: out std_logic_vector(1 downto 0));
	end component;	
	
	component state12
		port (
			state_en	: in std_logic;

			Ma_En		: out std_logic;
			Cd_En		: out std_logic;
			Data_Sel 	: out std_logic;
			REN 		: out std_logic;
			WEN 		: out std_logic;
			Valid_Data 	: out std_logic;
			Busy 		: out std_logic;
			Ca_En 		: out std_logic;
			Reset_St	: out std_logic;
			byte_out  	: out std_logic_vector(1 downto 0));
	end component;	
	
	component state13
		port (
			state_en	: in std_logic;

			Ma_En		: out std_logic;
			Cd_En		: out std_logic;
			Data_Sel 	: out std_logic;
			REN 		: out std_logic;
			WEN 		: out std_logic;
			Valid_Data 	: out std_logic;
			Busy 		: out std_logic;
			Ca_En 		: out std_logic;
			Reset_St	: out std_logic;
			byte_out  	: out std_logic_vector(1 downto 0));
	end component;	
	
	component state14
		port (
			state_en	: in std_logic;

			Ma_En		: out std_logic;
			Cd_En		: out std_logic;
			Data_Sel 	: out std_logic;
			REN 		: out std_logic;
			WEN 		: out std_logic;
			Valid_Data 	: out std_logic;
			Busy 		: out std_logic;
			Ca_En 		: out std_logic;
			Reset_St	: out std_logic;
			byte_out  	: out std_logic_vector(1 downto 0));
	end component;	
	
	component state15
		port (
			state_en	: in std_logic;

			Ma_En		: out std_logic;
			Cd_En		: out std_logic;
			Data_Sel 	: out std_logic;
			REN 		: out std_logic;
			WEN 		: out std_logic;
			Valid_Data 	: out std_logic;
			Busy 		: out std_logic;
			Ca_En 		: out std_logic;
			Reset_St	: out std_logic;
			byte_out  	: out std_logic_vector(1 downto 0));
	end component;	
	
	component state16
		port (
			state_en	: in std_logic;

			Ma_En		: out std_logic;
			Cd_En		: out std_logic;
			Data_Sel 	: out std_logic;
			REN 		: out std_logic;
			WEN 		: out std_logic;
			Valid_Data 	: out std_logic;
			Busy 		: out std_logic;
			Ca_En 		: out std_logic;
			Reset_St	: out std_logic;
			byte_out  	: out std_logic_vector(1 downto 0));
	end component;	
	
	component state17
		port (
			state_en	: in std_logic;
			byte_offset	: in std_logic_vector(1 downto 0);
			
			Ma_En		: out std_logic;
			Cd_En		: out std_logic;
			Data_Sel 	: out std_logic;
			REN 		: out std_logic;
			WEN 		: out std_logic;
			Valid_Data 	: out std_logic;
			Busy 		: out std_logic;
			Ca_En 		: out std_logic;
			Reset_St	: out std_logic;
			byte_out  	: out std_logic_vector(1 downto 0));
	end component;

	component state18
		port (
			state_en	: in std_logic;
			byte_offset	: in std_logic_vector(1 downto 0);
			
			Ma_En		: out std_logic;
			Cd_En		: out std_logic;
			Data_Sel 	: out std_logic;
			REN 		: out std_logic;
			WEN 		: out std_logic;
			Valid_Data 	: out std_logic;
			Busy 		: out std_logic;
			Ca_En 		: out std_logic;
			Reset_St	: out std_logic;
			byte_out  	: out std_logic_vector(1 downto 0));
	end component;
	
	component state19
		port (
			state_en	: in std_logic;
			byte_offset	: in std_logic_vector(1 downto 0);
			
			Ma_En		: out std_logic;
			Cd_En		: out std_logic;
			Data_Sel 	: out std_logic;
			REN 		: out std_logic;
			WEN 		: out std_logic;
			Valid_Data 	: out std_logic;
			Busy 		: out std_logic;
			Ca_En 		: out std_logic;
			Reset_St	: out std_logic;
			byte_out  	: out std_logic_vector(1 downto 0));
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
	
	component or20
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
		input20 : in std_logic;
	
		output : out std_logic);
	end component;
	
	component or21
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
			input20 : in std_logic;
			input21 : in std_logic;
			output : out std_logic);
	end component;
	
	component or12 
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
			input10: in std_logic;
			input11: in std_logic;
			input12: in std_logic;
			
			output : out std_logic);
	end component;
	
	for st0 : state0 use entity work.state0(structural);
	for st1	: state1 use entity work.state1(structural);
	for st2 : state2 use entity work.state2(structural);
	for st3 : state3 use entity work.state3(structural);
	for st4, st5, st6, st7, st8, st9 : wait_state use entity work.wait_state(structural);
	for st10 : state10 use entity work.state10(structural);
	for st11 : state11 use entity work.state11(structural);
	for st12 : state12 use entity work.state12(structural);
	for st13 : state13 use entity work.state13(structural);
	for st14 : state14 use entity work.state14(structural);
	for st15 : state15 use entity work.state15(structural);
	for st16 : state16 use entity work.state16(structural);
	for st17 : state17 use entity work.state17(structural);
	for st18 : state18 use entity work.state18(structural);
	for st19 : state19 use entity work.state19(structural);
	for sr : shift_reg20 use entity work.shift_reg20(structural);
	for inv1, inv2 : inv use entity work.inv(structural);
	for and2_1	:	and2 use entity work.and2(structural);
	for or20_1, or20_2, or20_3, or20_4, or20_5, or20_6, or20_7, or20_8, or20_9 :	or20 use entity work.or20(structural);
	for or12_1 : or12 use entity work.or12(structural);
	for or21_1 : or21 use entity work.or21(structural);
	
	--for st0out : state0out use entity work.state0out(structural);
	
	signal state, nstate, ResetState, NextState  : std_logic_vector(19 downto 0);
	signal one	:	std_logic := '1';
	signal zero	:	std_logic := '0';
	signal nreset, nclk, full_reset, temp_next, full_next : 	std_logic;

	signal temp_ma_en, temp_cd_en, temp_ca_en,  temp_data_sel, temp_ren, temp_wen, temp_valid_data, temp_busy : std_logic_vector(19 downto 0);
	signal byte_0, byte_1, byte_2, byte_3, byte_4, byte_5, byte_6, byte_7, byte_8, byte_9, byte_10, byte_11 : std_logic_vector(1 downto 0);
	
begin
	
	--Inverted Signals
	inv1	:	inv port map(Reset, nreset);
	inv2	:	inv port map(clk, nclk);

	--State handlers
	st0 : state0 port map(state(0), Reset, Start, ResetState(0), NextState(0), temp_ma_en(0), temp_cd_en(0), temp_data_sel(0), temp_ren(0), temp_wen(0), temp_valid_data(0), temp_busy(0), temp_ca_en(0)); --000000000001
	st1 : state1 port map(state(1), Read_Write, Hit_Miss, Ca(1 downto 0),temp_ma_en(1), temp_cd_en(1), temp_data_sel(1), temp_ren(1), temp_wen(1), temp_valid_data(1), temp_busy(1), temp_ca_en(1), byte_11);		
	st2 : state2 port map(state(2), Read_Write, Hit_Miss, Ca(1 downto 0), temp_ma_en(2), temp_cd_en(2), temp_data_sel(2), temp_ren(2), temp_wen(2), temp_valid_data(2), temp_busy(2), temp_ca_en(2), ResetState(2), byte_10);		
	st3 : state3 port map(state(3), Read_Write, Hit_Miss, temp_ma_en(3), temp_cd_en(3), temp_data_sel(3), temp_ren(3), temp_wen(3), temp_valid_data(3), temp_busy(3), temp_ca_en(3), ResetState(3));		
	st4 : wait_state port map(state(4), temp_ma_en(4), temp_cd_en(4), temp_data_sel(4), temp_ren(4), temp_wen(4), temp_valid_data(4), temp_busy(4), temp_ca_en(4), ResetState(4));		
	st5 : wait_state port map(state(5), temp_ma_en(5), temp_cd_en(5), temp_data_sel(5), temp_ren(5), temp_wen(5), temp_valid_data(5), temp_busy(5), temp_ca_en(5), ResetState(5));		
	st6 : wait_state port map(state(6), temp_ma_en(6), temp_cd_en(6), temp_data_sel(6), temp_ren(6), temp_wen(6), temp_valid_data(6), temp_busy(6), temp_ca_en(6), ResetState(6));		
	st7 : wait_state port map(state(7), temp_ma_en(7), temp_cd_en(7), temp_data_sel(7), temp_ren(7), temp_wen(7), temp_valid_data(7), temp_busy(7), temp_ca_en(7), ResetState(7));		
	st8 : wait_state port map(state(8), temp_ma_en(8), temp_cd_en(8), temp_data_sel(8), temp_ren(8), temp_wen(8), temp_valid_data(8), temp_busy(8), temp_ca_en(8), ResetState(8));		
	st9 : wait_state port map(state(9), temp_ma_en(9), temp_cd_en(9), temp_data_sel(9), temp_ren(9), temp_wen(9), temp_valid_data(9), temp_busy(9), temp_ca_en(9), ResetState(9));		
	st10 : state10 port map(state(10), temp_ma_en(10), temp_cd_en(10), temp_data_sel(10), temp_ren(10), temp_wen(10), temp_valid_data(10), temp_busy(10), temp_ca_en(10), ResetState(10), byte_0);
	st11 : state11 port map(state(11), temp_ma_en(11), temp_cd_en(11), temp_data_sel(11), temp_ren(11), temp_wen(11), temp_valid_data(11), temp_busy(11), temp_ca_en(11), ResetState(11), byte_1);
	st12 : state12 port map(state(12), temp_ma_en(12), temp_cd_en(12), temp_data_sel(12), temp_ren(12), temp_wen(12), temp_valid_data(12), temp_busy(12), temp_ca_en(12), ResetState(12), byte_2);
	st13 : state13 port map(state(13), temp_ma_en(13), temp_cd_en(13), temp_data_sel(13), temp_ren(13), temp_wen(13), temp_valid_data(13), temp_busy(13), temp_ca_en(13), ResetState(13), byte_3);
	st14 : state14 port map(state(14), temp_ma_en(14), temp_cd_en(14), temp_data_sel(14), temp_ren(14), temp_wen(14), temp_valid_data(14), temp_busy(14), temp_ca_en(14), ResetState(14), byte_4);
	st15 : state15 port map(state(15), temp_ma_en(15), temp_cd_en(15), temp_data_sel(15), temp_ren(15), temp_wen(15), temp_valid_data(15), temp_busy(15), temp_ca_en(15), ResetState(15), byte_5);
	st16 : state16 port map(state(16), temp_ma_en(16), temp_cd_en(16), temp_data_sel(16), temp_ren(16), temp_wen(16), temp_valid_data(16), temp_busy(16), temp_ca_en(16), ResetState(16), byte_6);
	st17 : state17 port map(state(17), Ca(1 downto 0), temp_ma_en(17), temp_cd_en(17), temp_data_sel(17), temp_ren(17), temp_wen(17), temp_valid_data(17), temp_busy(17), temp_ca_en(17), ResetState(17), byte_7);
	st18 : state18 port map(state(18), Ca(1 downto 0), temp_ma_en(18), temp_cd_en(18), temp_data_sel(18), temp_ren(18), temp_wen(18), temp_valid_data(18), temp_busy(18), temp_ca_en(18), ResetState(18), byte_8);
	st19 : state19 port map(state(19), Ca(1 downto 0), temp_ma_en(19), temp_cd_en(19), temp_data_sel(19), temp_ren(19), temp_wen(19), temp_valid_data(19), temp_busy(19), temp_ca_en(19), ResetState(19), byte_9);

	--All states combined reset_state & next_state signal or20
	or20_9	: or20 port map(Reset, ResetState(0), ResetState(2), ResetState(3), ResetState(4), ResetState(5), ResetState(6), ResetState(7), ResetState(8), ResetState(9), ResetState(10), ResetState(11), ResetState(12), ResetState(13), ResetState(14), ResetState(15), ResetState(16), ResetState(17), ResetState(18), ResetState(19), full_reset);
	or21_1	: or21 port map(Reset, state(0), state(1), state(2), state(3), state(4), state(5), state(6), state(7), state(8), state(9), state(10), state(11), state(12), state(13), state(14), state(15), state(16), state(17), state(18), state(19), temp_next);
	
	--Combine the change state with the clk 
	and2_1	: and2 port map(temp_next, clk, full_next);
	
	--Shift register that handless the increment of the states
	sr : shift_reg20 port map(full_reset, full_next, state, nstate);
		
	--State output signals combining

	or20_1	: or20 port map(temp_ma_en(0), temp_ma_en(1), temp_ma_en(2), temp_ma_en(3), temp_ma_en(4), temp_ma_en(5), temp_ma_en(6), temp_ma_en(7), temp_ma_en(8), temp_ma_en(9), temp_ma_en(10), temp_ma_en(11), temp_ma_en(12), temp_ma_en(13), temp_ma_en(14), temp_ma_en(15), temp_ma_en(16), temp_ma_en(17), temp_ma_en(18), temp_ma_en(19), Ma_En);
	or20_2	: or20 port map(temp_cd_en(0), temp_cd_en(1), temp_cd_en(2), temp_cd_en(3), temp_cd_en(4), temp_cd_en(5), temp_cd_en(6), temp_cd_en(7), temp_cd_en(8), temp_cd_en(9), temp_cd_en(10), temp_cd_en(11), temp_cd_en(12), temp_cd_en(13), temp_cd_en(14), temp_cd_en(15), temp_cd_en(16), temp_cd_en(17), temp_cd_en(18), temp_cd_en(19), Cd_En);
	or20_3	: or20 port map(temp_ca_en(0), temp_ca_en(1), temp_ca_en(2), temp_ca_en(3), temp_ca_en(4), temp_ca_en(5), temp_ca_en(6), temp_ca_en(7), temp_ca_en(8), temp_ca_en(9), temp_ca_en(10), temp_ca_en(11), temp_ca_en(12), temp_ca_en(13), temp_ca_en(14), temp_ca_en(15), temp_ca_en(16), temp_ca_en(17), temp_ca_en(18), temp_ca_en(19), Ca_En);
	or20_4	: or20 port map(temp_data_sel(0), temp_data_sel(1), temp_data_sel(2), temp_data_sel(3), temp_data_sel(4), temp_data_sel(5), temp_data_sel(6), temp_data_sel(7), temp_data_sel(8), temp_data_sel(9), temp_data_sel(10), temp_data_sel(11), temp_data_sel(12), temp_data_sel(13), temp_data_sel(14), temp_data_sel(15), temp_data_sel(16), temp_data_sel(17), temp_data_sel(18), temp_data_sel(19), Data_Sel);
	or20_5	: or20 port map(temp_ren(0), temp_ren(1), temp_ren(2), temp_ren(3), temp_ren(4), temp_ren(5), temp_ren(6), temp_ren(7), temp_ren(8), temp_ren(9), temp_ren(10), temp_ren(11), temp_ren(12), temp_ren(13), temp_ren(14), temp_ren(15), temp_ren(16), temp_ren(17), temp_ren(18), temp_ren(19), REN);
	or20_6	: or20 port map(temp_wen(0), temp_wen(1), temp_wen(2), temp_wen(3), temp_wen(4), temp_wen(5), temp_wen(6), temp_wen(7), temp_wen(8), temp_wen(9), temp_wen(10), temp_wen(11), temp_wen(12), temp_wen(13), temp_wen(14), temp_wen(15), temp_wen(16), temp_wen(17), temp_wen(18), temp_wen(19), WEN);
	or20_7	: or20 port map(temp_valid_data(0), temp_valid_data(1), temp_valid_data(2), temp_valid_data(3), temp_valid_data(4), temp_valid_data(5), temp_valid_data(6), temp_valid_data(7), temp_valid_data(8), temp_valid_data(9), temp_valid_data(10), temp_valid_data(11), temp_valid_data(12), temp_valid_data(13), temp_valid_data(14), temp_valid_data(15), temp_valid_data(16), temp_valid_data(17), temp_valid_data(18), temp_valid_data(19), Valid_Data);
	or20_8	: or20 port map(temp_busy(0), temp_busy(1), temp_busy(2), temp_busy(3), temp_busy(4), temp_busy(5), temp_busy(6), temp_busy(7), temp_busy(8), temp_busy(9), temp_busy(10), temp_busy(11), temp_busy(12), temp_busy(13), temp_busy(14), temp_busy(15), temp_busy(16), temp_busy(17), temp_busy(18), temp_busy(19), Busy);	
	
	--Ma(7 downto 0) <= state(7 downto 0);	
	Ma <= Ca;

	-- Byte output
	or12_1	: or12 port map( byte_0(0), byte_1(0), byte_2(0), byte_3(0), byte_4(0), byte_5(0), byte_6(0), byte_7(0), byte_8(0), byte_9(0), byte_10(0), byte_11(0), byte_out(0));
	or12_2	: or12 port map( byte_0(1), byte_1(1), byte_2(1), byte_3(1), byte_4(1), byte_5(1), byte_6(1), byte_7(1), byte_8(1), byte_9(1), byte_10(1), byte_11(1), byte_out(1));
	
	-- byte_out <= Ca(1 downto 0);
	--Ca <= nstate(7 downto 0);
	
end structural;