-- 
-- Entity: mux
-- Architecture : structural
-- Author: Abenezer Wudenhe (a157@umbc.edu)
--

library STD;
library IEEE;
use IEEE.std_logic_1164.all;
entity mux is
  port (
    A : in std_logic;
    B : in std_logic;
    sel : in std_logic;
    output : out std_logic);
end mux;

architecture structural of mux is

  component and2
    port (
      input1 : in std_logic;
      input2 : in std_logic;
      output : out std_logic);
  end component;

  component or2
    port (
      input1 : in std_logic;
      input2 : in std_logic;
      output : out std_logic);
  end component;

  component inv
    port (
      input : in std_logic;
      output : out std_logic);
  end component;

  for in_0: inv use entity work.inv(structural);
  for and2_0, and2_1: and2 use entity work.and2(structural);
  for or2_0 : or2 use entity work.or2(structural);
  signal Notsel, temp0, temp1 : std_logic;
  signal Dout, Addout, Aout: std_logic;

begin

  in_0: inv port map(sel, Notsel);
  and2_0: and2 port map (A, sel, temp0);
  and2_1: and2 port map (B, Notsel, temp1);
  or2_0: or2 port map (temp0, temp1, output);
  
end structural;
