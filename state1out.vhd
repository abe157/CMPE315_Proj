library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity state1out is
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
end state1out;

architecture structural of state1out is

begin

	output: process (state_en)                  

  begin                           
    if state_en = '1' then 
		Ma_En <= '0';
		Cd_En <= '0';
		Data_Sel <= '0';
		REN <= '0';
		WEN <= '0';
		Valid_Data <= '0';
		Cache_Reset<= '0';
		Busy <= '1';
	end if; 
 end process output;    



end structural;