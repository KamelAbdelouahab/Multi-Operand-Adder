library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
library work;
use work.DataTypes.all;

entity MOAStage is
  generic(
    BITWIDTH     : integer := CONST_DATA_WIDTH;
    NUM_OPERANDS : integer := CONST_NUM_OPERANDS;
    SUM_WIDTH    : integer := CONST_SUM_WIDTH
    );
  port(
    clk       : in  std_logic;
    reset_n   : in  std_logic;
    enable    : in  std_logic;
    in_data   : in  data_array (0 to NUM_OPERANDS - 1);
    in_valid  : in  std_logic;
    out_data  : out data_array (0 to NUM_OPERANDS/2 - 1);
    out_valid : out std_logic
    );
end entity;


architecture rtl of MOAStage is
  component SOA is
    generic(
      BITWIDTH : integer := CONST_DATA_WIDTH
      );
    port(
      clk       : in  std_logic;
      reset_n   : in  std_logic;
      enable    : in  std_logic;
      in_op1    : in  std_logic_vector (BITWIDTH-1 downto 0);
      in_op2    : in  std_logic_vector (BITWIDTH-1 downto 0);
      in_valid  : in  std_logic;
      out_data  : out std_logic_vector (BITWIDTH-1 downto 0);
      out_valid : out std_logic
      );
  end component;
begin

  adder_gen : for i in 0 to (NUM_OPERANDS/2 - 1) generate
    inst_soa : SOA
      generic map(
        BITWIDTH => BITWIDTH
        )
      port map(
        clk       => clk,
        reset_n   => reset_n,
        enable    => enable,
        in_op1    => in_data(i),
        in_op2    => in_data(2*i+1),
        in_valid  => in_valid,
        out_data  => out_data(i),
        out_valid => out_valid
        );


  end generate;

end architecture;
