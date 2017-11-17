library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity cache is
  port (

		clk : in std_logic;
		Read_Write : in std_logic;
		Start : in std_logic;
		Reset : in std_logic
		Hit_Miss : in std_logic
		Ca address : in std_logic_vector(7 downto 0);

		Ma : out std_logic_vector(7 downto 0);
		Ma_En : out std_logic;
		Cd_En : out std_logic;
		Data_Sel : out std_logic;
		REN : out std_logic;
		WEN : out std_logic;
		Valid_Data : out std_logic;
		Cache_Reset : out std_logic
	);
end cache;


architecture structural of cache is



	
	
begin
		
	
	

end structural;