

--
-- Entity: inv 
-- Architecture : structural 
-- Author: cpatel2
-- Created On: 10/20/00 at 13:32
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity inv is

  port (
    input    : in  std_logic;
    output   : out std_logic);
end inv;

architecture structural of inv is

begin

  output <= not (input);

end structural;













