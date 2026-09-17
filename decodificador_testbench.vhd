library IEEE;
use IEEE.std_logic_1164.all;

entity tb_decodificador2_4bits is
end tb_decodificador2_4bits;

architecture arch_1 of tb_decodificador2_4bits is

  -- Componente DUT
  component decodificador2_4bits is
    port (
      i_A  : in std_logic;   -- Entrada de dados A
      i_B  : in std_logic;   -- Entrada de dados B
      o_S0 : out std_logic;  -- Saída S0 de dados
      o_S1 : out std_logic;  -- Saída S1 de dados
      o_S2 : out std_logic;  -- Saída S2 de dados
      o_S3 : out std_logic   -- Saída S3 de dados
    );
  end component;

  signal w_A, w_B, w_S0, w_S1, w_S2, w_S3 : std_logic;

begin

  -- Mapeamento dos fios
  u_DUT : decodificador2_4bits port map(
    i_A  => w_A,
    i_B  => w_B,
    o_S0 => w_S0,
    o_S1 => w_S1,
    o_S2 => w_S2,
    o_S3 => w_S3
  );

  process
  begin
    -- A = 0 e B = 0
    w_A <= '0';
    w_B <= '0';
    wait for 1 ns;
    assert(w_S0 = '1' and w_S1 = '0' and w_S2 = '0' and w_S3 = '0') report "Falha @ 00" severity error;

    -- A = 0 e B = 1
    w_A <= '0';
    w_B <= '1';
    wait for 1 ns;
    assert(w_S0 = '0' and w_S1 = '1' and w_S2 = '0' and w_S3 = '0') report "Falha @ 01" severity error;

    -- A = 1 e B = 0
    w_A <= '1';
    w_B <= '0';
    wait for 1 ns;
    assert(w_S0 = '0' and w_S1 = '0' and w_S2 = '1' and w_S3 = '0') report "Falha @ 10" severity error;

    -- A = 1 e B = 1
    w_A <= '1';
    w_B <= '1';
    wait for 1 ns;
    assert(w_S0 = '0' and w_S1 = '0' and w_S2 = '0' and w_S3 = '1') report "Falha @ 11" severity error;

    wait;
  end process;

end arch_1;