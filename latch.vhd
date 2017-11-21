library STD;
library IEEE;                      
use IEEE.std_logic_1164.all;       

entity latch is                      
  port ( d   : in  std_logic;
         clk : in  std_logic;
         q   : out std_logic;
         qbar: out std_logic); 
end latch;                          

architecture structural of latch is 
  
begin
  output: process                 
  begin                           
    wait until ( clk'EVENT or clk = '0' ); 
    q <= d;
    qbar <= not d ;
  end process output;      
end structural;  
