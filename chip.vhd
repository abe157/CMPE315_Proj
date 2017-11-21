--
--Entity: chip
--Architecture: structural
-- Arthur: a157

library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity chip is
  
  port (
      cpu_add    : in  std_logic_vector(7 downto 0);
      cpu_data   : inout  std_logic_vector(7 downto 0);
      cpu_rd_wrn : in  std_logic;    
      start      : in  std_logic;
      clk        : in  std_logic;
      reset      : in  std_logic;
      mem_data   : in  std_logic_vector(7 downto 0);
      Vdd	 : in  std_logic;
      Gnd        : in  std_logic;
      busy       : out std_logic;
      mem_en     : out std_logic;
      mem_add    : out std_logic_vector(7 downto 0));
end chip;

architecture structural of chip is


component state_machine
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

	for sm	: state_machine use entity work.state_machine(structural);
	--for st0out : state0out use entity work.state0out(structural); 
	signal zero : std_logic := '0';
	signal temp1 : std_logic_vector(7 downto 0);
	signal temp2 : std_logic_vector(7 downto 0);
	
begin  -- structural

	--State machine					clk  rd/wr   start reset hit/miss ca         ma     ma_en    cd_en    data_sel    ren      wen        valid/data cache/reset busy 
	sm	:	state_machine port map(clk, cpu_rd_wrn, start, reset, zero, cpu_add, temp1, temp2(0), temp2(1), temp2(2), temp2(3), temp2(4), temp2(5), temp2(6), busy);
	--st0out : state0out port map(Vdd, temp2(0), temp2(1), temp2(2), temp2(3), temp2(4), temp2(5), temp2(6), busy);
	
	
  --busy <= Vdd;
  mem_en <= Vdd;
  mem_add <= cpu_add;

end structural;
