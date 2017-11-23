library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity reg8 is
  port (
    input :  in std_logic_vector(7 downto 0);
    clk   :  in std_logic;
    output:  out std_logic_vector(7 downto 0));
end reg8;

architecture structural of reg8 is
	
  component Dlatch                     
    port ( 
      d   : in  std_logic;
      clk : in  std_logic;
      q   : out std_logic;
      qbar: out std_logic); 
  end component;        
  
  for Dlatch_0, Dlatch_1, Dlatch_2, Dlatch_3, Dlatch_4, Dlatch_5, Dlatch_6, Dlatch_7: Dlatch use entity work.Dlatch(structural);
  signal outbar:	std_logic_vector(7 downto 0);
  
begin

  Dlatch_0	:  Dlatch port map(input(0), clk, output(0), outbar(0));
  Dlatch_1	:  Dlatch port map(input(1), clk, output(1), outbar(1));
  Dlatch_2	:  Dlatch port map(input(2), clk, output(2), outbar(2));
  Dlatch_3	:  Dlatch port map(input(3), clk, output(3), outbar(3));
  Dlatch_4	:  Dlatch port map(input(4), clk, output(4), outbar(4));
  Dlatch_5	:  Dlatch port map(input(5), clk, output(5), outbar(5));
  Dlatch_6	:  Dlatch port map(input(6), clk, output(6), outbar(6));
  Dlatch_7	:  Dlatch port map(input(7), clk, output(7), outbar(7));

end structural;	
