library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity reg is
  port (
    input :  in std_logic;
    clk   :  in std_logic;
    output:  out std_logic);
end reg;

architecture structural of reg is
	
  component Dlatch                     
    port ( 
      d   : in  std_logic;
      clk : in  std_logic;
      q   : out std_logic;
      qbar: out std_logic); 
  end component;        
  
  for Dlatch_1:	Dlatch use entity work.Dlatch(structural);
  signal outbar:	std_logic;
  
begin

  Dlatch_1	:  Dlatch port map(input, clk, output, outbar);

end structural;	
