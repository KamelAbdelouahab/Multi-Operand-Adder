library ieee;
    use ieee.std_logic_1164.all;
    use ieee.math_real.all;
library work;
    use work.DataTypes.all;

entity SerialMOA is
    generic(
        DATA_WIDTH   : natural := CONST_DATA_WIDTH;   -- Bitwidth
        NUM_OPERANDS : natural := CONST_NUM_OPERANDS; -- Number of operands
        SUM_WIDTH    : natural := CONST_SUM_WIDTH
    );
    port(
        clk_dsp    : in  std_logic;
        clk_sys    : in  std_logic;
        reset_n    : in  std_logic;
        in_data    : in  data_array (0 to NUM_OPERANDS-1);
        in_valid   : in  std_logic;
        out_data   : out std_logic_vector (SUM_WIDTH-1 downto 0)
    );
end entity SerialMOA;

architecture bhv of SerialMOA is
    -- Serializer
  component Serializer
    generic (
    NUM_OPERANDS : natural;
    DATA_WIDTH   : natural
    );
    port (
    clk_dsp  : in  std_logic;
    clk_sys  : in  std_logic;
    reset_n  : in  std_logic;
    in_data  : in  data_array (0 to NUM_OPERANDS-1);
    in_valid : in  std_logic;
    out_data : out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
  end component Serializer;
  -- Accumulator
  component Accumulator
  generic (
    NUM_OPERANDS : natural;
    DATA_WIDTH   : natural;
    SUM_WIDTH    : natural
    );
    port (
    clk_dsp  : in  std_logic;
    reset_n  : in  std_logic;
    in_data  : in  std_logic_vector(DATA_WIDTH-1 downto 0);
    out_data : out std_logic_vector(SUM_WIDTH-1 downto 0)
    );
  end component Accumulator;

    -- SIGNALS
    -----------------------------
  signal acc_data : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal dummy_in : data_array (0 to NUM_OPERANDS-1);
  begin

  Serializer_i : Serializer
  generic map (
    NUM_OPERANDS => NUM_OPERANDS,
    DATA_WIDTH   => DATA_WIDTH
  )
  port map (
    clk_dsp  => clk_dsp,
    clk_sys  => clk_sys,
    reset_n  => reset_n,
    in_data  => in_data,
    in_valid => in_valid,
    out_data => acc_data
  );

  Accumulator_i : Accumulator
  generic map (
    NUM_OPERANDS => NUM_OPERANDS,
    DATA_WIDTH   => DATA_WIDTH,
    SUM_WIDTH    => SUM_WIDTH
  )
  port map (
    clk_dsp  => clk_dsp,
    reset_n  => reset_n,
    in_data  => acc_data,
    out_data => out_data
  );

end architecture bhv;
