library IEEE;
use IEEE.std_logic_1164.all;

entity decodificador2_4bits is
  port (
    i_A  : in std_logic;   -- Entrada de dados A
    i_B  : in std_logic;   -- Entrada de dados B
    o_S0 : out std_logic;  -- Saída S0 de dados
    o_S1 : out std_logic;  -- Saída S1 de dados
    o_S2 : out std_logic;  -- Saída S2 de dados
    o_S3 : out std_logic   -- Saída S3 de dados
  );
end decodificador2_4bits;

architecture arch_1 of decodificador2_4bits is
begin
  o_S0 <= (not i_A and not i_B);
  o_S1 <= (not i_A and i_B);
  o_S2 <= (i_A and not i_B);
  o_S3 <= (i_A and i_B);
end arch_1;