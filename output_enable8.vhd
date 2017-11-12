-- 
-- Entity: mux
-- Architecture : structural
-- Author: Abenezer Wudenhe (a157@umbc.edu)
--

library STD;
library IEEE;
use IEEE.std_logic_1164.all;
entity output_enable is
  port (
    input : in std_logic_vector(7 downto 0);
    en : in std_logic;
    output : out std_logic_vector(7 downto 0));
end output_enable;

architecture structural of output_enable is

  component and2
    port (
      input1 : in std_logic;
      input2 : in std_logic;
      output : out std_logic);
  end component;
  
  for and2_0, and2_1, and2_3, and2_4, and2_5, and2_6, and2_7: and2 use entity work.and2(structural);
  
begin

  and2_0: and2 port map(input(0), en, output(0));
  and2_1: and2 port map(input(1), en, output(1));
  and2_2: and2 port map(input(2), en, output(2));
  and2_3: and2 port map(input(3), en, output(3));
  and2_4: and2 port map(input(4), en, output(4));
  and2_5: and2 port map(input(5), en, output(5));
  and2_6: and2 port map(input(6), en, output(6));
  and2_7: and2 port map(input(7), en, output(7));
  

end structural;                    
