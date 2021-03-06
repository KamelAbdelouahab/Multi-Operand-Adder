library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;

library work;
use work.DataTypes.all;

entity SerialMOA_tb is
end entity SerialMOA_tb;

architecture tb of SerialMOA_tb is
-- C.U.T
  component SerialMOA
    generic (
      DATA_WIDTH   : natural := CONST_DATA_WIDTH;
      NUM_OPERANDS : natural := CONST_NUM_OPERANDS;
      SUM_WIDTH    : natural := CONST_SUM_WIDTH
      );
    port (
      clk_dsp  : in  std_logic;
      clk_sys  : in  std_logic;
      reset_n  : in  std_logic;
      in_data  : in  data_array (0 to NUM_OPERANDS-1);
      in_valid : in  std_logic;
      out_data : out std_logic_vector (SUM_WIDTH-1 downto 0)
      );
  end component SerialMOA;

-- TEST BENCH TIMINGS
  constant T_CLK_DSP : time := 10 ns;
  constant T_CLK_SYS : time := 110 ns;
  constant T_SIM     : time := 1500 ns;
  constant INPUT_OPERAND : data_array (0 to CONST_NUM_OPERANDS-1) := (std_logic_vector(to_signed(1, CONST_DATA_WIDTH)),
                                                                      std_logic_vector(to_signed(2, CONST_DATA_WIDTH)),
                                                                      std_logic_vector(to_signed(3, CONST_DATA_WIDTH)),
                                                                      std_logic_vector(to_signed(4, CONST_DATA_WIDTH)),
                                                                      std_logic_vector(to_signed(5, CONST_DATA_WIDTH)),
                                                                      std_logic_vector(to_signed(6, CONST_DATA_WIDTH)),
                                                                      std_logic_vector(to_signed(7, CONST_DATA_WIDTH)),
                                                                      std_logic_vector(to_signed(8, CONST_DATA_WIDTH)),
                                                                      std_logic_vector(to_signed(9, CONST_DATA_WIDTH)),
                                                                      std_logic_vector(to_signed(10, CONST_DATA_WIDTH))
                                                                      );
-- SIGNALS
  signal s_clk_dsp  : std_logic := '0';
  signal s_clk_sys  : std_logic := '0';
  signal s_reset_n  : std_logic := '0';
  signal s_in_valid : std_logic := '1';
  signal s_in_data  : data_array (0 to CONST_NUM_OPERANDS-1);
  signal s_out_data : std_logic_vector (CONST_SUM_WIDTH-1 downto 0);

begin
  SerialMOA_i : SerialMOA
    generic map (
      DATA_WIDTH   => CONST_DATA_WIDTH,
      NUM_OPERANDS => CONST_NUM_OPERANDS,
      SUM_WIDTH    => CONST_SUM_WIDTH
      )
    port map (
      clk_dsp  => s_clk_dsp,
      clk_sys  => s_clk_sys,
      reset_n  => s_reset_n,
      in_data  => s_in_data,
      in_valid => s_in_valid,
      out_data => s_out_data
      );

  clk_dsp_stim : process
  begin
    s_clk_dsp <= not(s_clk_dsp);
    wait for T_CLK_DSP/2;
  end process;

  clk_sys_stim : process
  begin
    s_clk_sys <= not(s_clk_sys);
    wait for T_CLK_SYS/2;
  end process;

  operand_stim : process
  begin
    s_in_data <= INPUT_OPERAND;
    wait for T_CLK_SYS;
  end process;

  reset_stim : process
  begin
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
