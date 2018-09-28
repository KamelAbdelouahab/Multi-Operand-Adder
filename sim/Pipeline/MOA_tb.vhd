library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;

library work;
use work.DataTypes.all;

entity MOA_tb is
end entity MOA_tb;

architecture tb of MOA_tb is
-- C.U.T
  component MOA
    generic (
      BITWIDTH     : natural := CONST_DATA_WIDTH;
      NUM_OPERANDS : natural := CONST_NUM_OPERANDS;
      SUM_WIDTH    : natural := CONST_SUM_WIDTH
      );
    port(
      clk       : in  std_logic;
      reset_n   : in  std_logic;
      enable    : in  std_logic;
      in_data   : in  data_array (0 to NUM_OPERANDS - 1);
      in_valid  : in  std_logic;
      out_data  : out std_logic_vector (SUM_WIDTH-1 downto 0);
      out_valid : out std_logic
      );
  end component MOA;

-- TEST BENCH TIMINGS
  constant T_CLK_DSP      : time := 10 ns;
  constant T_CLK_SYS      : time := 100 ns;
  constant T_SIM          : time := 1500 ns;
  constant INPUT_OPERAND1 : data_array (0 to CONST_NUM_OPERANDS-1) :=
    (std_logic_vector(to_signed(01, CONST_DATA_WIDTH)),
     std_logic_vector(to_signed(02, CONST_DATA_WIDTH)),
     std_logic_vector(to_signed(03, CONST_DATA_WIDTH)),
     std_logic_vector(to_signed(04, CONST_DATA_WIDTH)),
     std_logic_vector(to_signed(05, CONST_DATA_WIDTH)),
     std_logic_vector(to_signed(06, CONST_DATA_WIDTH)),
     std_logic_vector(to_signed(07, CONST_DATA_WIDTH)),
     std_logic_vector(to_signed(08, CONST_DATA_WIDTH)),
     std_logic_vector(to_signed(09, CONST_DATA_WIDTH)),
     std_logic_vector(to_signed(10, CONST_DATA_WIDTH))
     );
  constant INPUT_OPERAND2 : data_array (0 to CONST_NUM_OPERANDS-1) :=
    (std_logic_vector(to_signed(11, CONST_DATA_WIDTH)),
     std_logic_vector(to_signed(12, CONST_DATA_WIDTH)),
     std_logic_vector(to_signed(13, CONST_DATA_WIDTH)),
     std_logic_vector(to_signed(14, CONST_DATA_WIDTH)),
     std_logic_vector(to_signed(15, CONST_DATA_WIDTH)),
     std_logic_vector(to_signed(16, CONST_DATA_WIDTH)),
     std_logic_vector(to_signed(17, CONST_DATA_WIDTH)),
     std_logic_vector(to_signed(18, CONST_DATA_WIDTH)),
     std_logic_vector(to_signed(19, CONST_DATA_WIDTH)),
     std_logic_vector(to_signed(20, CONST_DATA_WIDTH))
     );
-- SIGNALS
  signal s_clk       : std_logic := '0';
  signal s_reset_n   : std_logic := '0';
  signal s_in_valid  : std_logic := '1';
  signal s_out_valid : std_logic;
  signal s_in_data   : data_array (0 to CONST_NUM_OPERANDS-1);
  signal s_out_data  : std_logic_vector (CONST_SUM_WIDTH-1 downto 0);

begin
  MOA_i : MOA
    generic map (
      BITWIDTH     => CONST_DATA_WIDTH,
      NUM_OPERANDS => CONST_NUM_OPERANDS,
      SUM_WIDTH    => CONST_SUM_WIDTH
      )
    port map (
      clk       => s_clk,
      reset_n   => s_reset_n,
      enable    => '1',
      in_valid  => s_in_valid,
      in_data   => s_in_data,
      out_data  => s_out_data,
      out_valid => s_out_valid
      );

  clk_stim : process
  begin
    wait for T_CLK_SYS/2;
    s_clk <= not(s_clk);
  end process;

  operand_stim : process
  begin
    s_in_data <= INPUT_OPERAND1;
    wait for T_CLK_SYS;
    s_in_data <= INPUT_OPERAND2;
    wait for T_CLK_SYS;
  end process;

  reset_stim : process
  begin
    -- s_reset_n <= '1';
    s_reset_n <= '0';
    wait for T_CLK_SYS;
    s_reset_n <= '1';
    wait for T_SIM;
  end process;

  -- in_valid_sim : Process
  -- Begin
  --     s_in_valid <= '1';
  --     wait for T_CLK_DSP;
  --     s_in_valid <= '0';
  --     wait for T_CLK_SYS  - T_CLK_DSP;
  -- End process;

end architecture;
