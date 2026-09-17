library ieee;
use ieee.std_logic_1164.all;

entity codificador4_2bits is
  port(
    i_A : in std_logic; --Entrada A one-hot
    i_B : in std_logic; --Entrada B one-hot
    i_C : in std_logic; --Entrada C one-hot
    i_D : in std_logic; --Entrada D one-hot
    o_S0 : out std_logic; --Saida S0 binario
    o_S1 : out std_logic --Saisa S1 binario
  );
end codificador4_2bits;

architecture arch_1 of codificador4_2bits is
begin
  o_S0 <= (i_B and not i_C) or i_D;
  o_S1 <= i_C or i_D;
end arch_1;
