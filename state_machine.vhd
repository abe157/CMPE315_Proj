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
		Cache_Reset : out std_logic
		Busy : out std_logic;
	);
end state_machine;


architecture rtl of state_machine is
	type State_type is (State0, State1, State2, State3);  -- Define the state
	signal State : State_Type;   						  -- Create a signal that uses the states

begin

	smprocess : process (clk, Reset, Read_Write, Start, Hit_Miss, Ca)                  
	begin            
		if Reset = '1' then					-- Reset is Pressed
			State <= State0;
		elsif falling_edge(clk) then		-- Falling Edge clk
			
		
		
		
		
		
	end process smprocess;
		


end rtl;