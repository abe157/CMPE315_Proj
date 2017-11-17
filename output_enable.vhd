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
  
  component tx                      
  port ( sel   : in std_logic;
         selnot: in std_logic;
         input : in std_logic;
         output:out std_logic);
 end component; 
 
 component inv
  port (
    input    : in  std_logic;
    output   : out std_logic);
 end component;
  
  signal en_bar : std_logic;
  for tx_0, tx_1, tx_3, tx_4, tx_5, tx_6, tx_7 : tx use entity work.tx(structural);
  for inv_0 : inv use entity work.inv(structural);
  
begin
	inv_0 : inv port map(en, en_bar);
	
	
  tx_0: tx port map(en, en_bar, input(0), output(0));
  tx_1: tx port map(en, en_bar, input(1), output(1));
  tx_2: tx port map(en, en_bar, input(2), output(2));
  tx_3: tx port map(en, en_bar, input(3), output(3));
  tx_4: tx port map(en, en_bar, input(4), output(4));
  tx_5: tx port map(en, en_bar, input(5), output(5));
  tx_6: tx port map(en, en_bar, input(6), output(6));
  tx_7: tx port map(en, en_bar, input(7), output(7));
  

end structural;                    
