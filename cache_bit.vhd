library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity cache_bit is
  port (
    Reset      :  in std_logic;
    Write_data :  in std_logic;
    Write_en   :  in std_logic;
    Read_en    :  in std_logic;
    Read_data  :  out std_logic);
end cache_bit;

architecture structural of cache_bit is
	
  component and2 
    port (
      input1 : in std_logic;
      input2 : in std_logic;
      output : out std_logic);
  end component;

  component inv
    port (
      input    : in  std_logic;
      output   : out std_logic);
    end component;

  component Dlatch                     
    port ( 
      d   : in  std_logic;
      clk : in  std_logic;
      q   : out std_logic;
      qbar: out std_logic); 
  end component;
 
  component tx                      
    port ( 
      sel   : in std_logic;
      selnot: in std_logic;
      input : in std_logic;
      output:out std_logic);
  end component;
  
  component or2
	  port (
  	 input1 : in std_logic;
  	 input2 : in std_logic;
  	 output : out std_logic);
  end component;

  for and2_0 : and2 use entity work.and2(structural);
  for tx_0 : tx use entity work.tx(structural);
  for Dlatch_0 : Dlatch use entity work.Dlatch(structural);
  for inv_0, inv_1 : inv use entity work.inv(structural);
  for or2_0 : or2 use entity work.or2(structural);

  signal Reset_bar, Read_en_bar, mux_d, wen: std_logic;

  signal q_temp, q_temp_bar : std_logic;

  begin

    inv_0 : inv port map(Reset, Reset_bar);
    inv_1 : inv port map(Read_en, Read_en_bar);
    and2_0 : and2 port map(Reset_bar, Write_data, mux_d); --sets the value to 0
    or2_0 : or2 port map(Write_en, Reset, wen);
    Dlatch_0 : Dlatch port map(mux_d, wen, q_temp, q_temp_bar);
    tx_0  : tx port map(Read_en, Read_en_bar, q_temp, Read_data);

end structural;                          
        