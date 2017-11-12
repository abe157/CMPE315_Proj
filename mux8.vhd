-- 
-- Entity: mux
-- Architecture : structural
-- Author: Abenezer Wudenhe (a157@umbc.edu)
--

library STD;
library IEEE;
use IEEE.std_logic_1164.all;
entity mux8 is
  port (
    A : in std_logic_vector(7 downto 0);
    B : in std_logic_vector(7 downto 0);
    sel : in std_logic;
    output : out std_logic_vector(7 downto 0));
end mux8;

architecture structural of mux8 is


  component mux
    port (
      A : in std_logic;
      B : in std_logic;
      sel : in std_logic;
      output : out std_logic);
  end component;

  for mux_0, mux_1, mux_2, mux_3, mux_4, mux_5, mux_6, mux_7 : mux use entity work.mux(structural);
  
begin
  
  mux_0: mux port map(A(0), B(0), sel, output(0));
  mux_1: mux port map(A(1), B(1), sel, output(1));
  mux_2: mux port map(A(2), B(2), sel, output(2));
  mux_3: mux port map(A(3), B(3), sel, output(3));
  mux_4: mux port map(A(4), B(4), sel, output(4));
  mux_5: mux port map(A(5), B(5), sel, output(5));
  mux_6: mux port map(A(6), B(6), sel, output(6));
  mux_7: mux port map(A(7), B(7), sel, output(7));
  
end structural;
