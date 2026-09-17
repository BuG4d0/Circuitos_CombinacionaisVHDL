library ieee;
use ieee.std_logic_1164.all;

entity tb_codificador4_2bits is
end tb_codificador4_2bits;


architecture arch_1 of tb_codificador4_2bits is

  component codificador4_2bits
    port(
      i_A : in std_logic; --Entrada A one-hot
      i_B : in std_logic; --Entrada B one-hot
      i_C : in std_logic; --Entrada C one-hot
      i_D : in std_logic; --Entrada D one-hot
      o_S0 : out std_logic; --Saida S0 binario
      o_S1 : out std_logic --Saisa S1 binario
    );
  end component;

  signal w_A, w_B, w_C, w_D, w_S0, w_S1 : std_logic;

begin

  u_DUT : codificador4_2bits port map(
      i_A => w_A,
      i_B => w_B,
      i_C => w_C,
      i_D => w_D,
      o_S0 => w_S0,
      o_S1 => w_S1
    );

  process
  begin

    w_A <= '1';
    w_B <= '0';
    w_C <= '0';
    w_D <= '0';
    wait for 1 ns;
    assert(w_S0 = '0' and w_S1 = '0') report "Falha @ 00" severity error;
    

    w_A <= '0';
    w_B <= '1';
    w_C <= '0';
    w_D <= '0';
    wait for 1 ns;
    assert(w_S0 = '1' and w_S1 = '0') report "Falha @ 01" severity error;

    w_A <= '0';
    w_B <= '0';
    w_C <= '1';
    w_D <= '0';
    wait for 1 ns;
    assert(w_S0 = '0' and w_S1 = '1') report "Falha @ 10" severity error;

    w_A <= '0';
    w_B <= '0';
    w_C <= '0';
    w_D <= '1';
    wait for 1 ns;
    assert(w_S0 = '1' and w_S1 = '1') report "Falha @ 11" severity error;
    
    wait;
  end process;

end arch_1;
