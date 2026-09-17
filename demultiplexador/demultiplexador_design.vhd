library ieee;
use ieee.std_logic_1164.all;

entity Demux1_2bit is
  port (
    i_SEL : in  std_logic;
    i_A   : in  std_logic;
    o_S0  : out std_logic;
    o_S1  : out std_logic
  );
end Demux1_2bit;

architecture arch_1 of Demux1_2bit is
begin
  o_S0 <= i_A AND (not i_SEL);
  o_S1 <= i_A AND i_SEL;
end arch_1;
