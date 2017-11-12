-- 
-- Entity: mux
-- Architecture : structural
-- Author: Abenezer Wudenhe (a157@umbc.edu)
--

library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity hit_miss is
  port (
    input1 : in std_logic_vector(2 downto 0);
    input2 : in std_logic_vector(2 downto 0);
	valid  : in std_logic;
    output : out std_logic);
end hit_miss;

architecture structural of hit_miss is

  component xor2
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

  component and2
      port (
          input1 : in std_logic;
          input2 : in std_logic;
          output : out std_logic);
  end component;
  
  for inv_0, inv_1, inv_2: inv use entity work.inv(structural);
  for xor2_0, xor2_1, xor2_2: xor2 use entity work.xor2(structural);
  for and2_0, and2_1, and2_2: and2 use entity work.and2(structural);
  signal xor_0, xor_1, xor_2, out_0, out_1, out_2, temp_0, output_temp: std_logic;
  
begin
  
  xor2_0: xor2 port map(input1(0), input2(0), xor_0);
  xor2_1: xor2 port map(input1(1), input2(1), xor_1);
  xor2_2: xor2 port map(input1(2), input2(2), xor_2);

  inv_0: inv port map(xor_0, out_0);
  inv_1: inv port map(xor_1, out_1);
  inv_2: inv port map(xor_2, out_2);

  and2_0: and2 port map(out_0, out_1, temp_0);
  and2_1: and2 port map(temp_0, out_2, output_temp);
  
  and2_2: and2 port map(output_temp, valid, output);
  
end structural;        
