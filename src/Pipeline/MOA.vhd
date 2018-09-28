library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
library work;
use work.DataTypes.all;

entity MOA is
  generic(
    BITWIDTH     : integer := CONST_DATA_WIDTH;
    NUM_OPERANDS : integer := CONST_NUM_OPERANDS;
    SUM_WIDTH    : integer := CONST_SUM_WIDTH
   --PIP_STRD     : integer
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
end MOA;


architecture rtl of MOA is
  component MOAStage is
    generic(
      BITWIDTH     : integer := CONST_DATA_WIDTH;
      NUM_OPERANDS : integer := CONST_NUM_OPERANDS;
      SUM_WIDTH    : integer := CONST_SUM_WIDTH
     --PIP_STRD     : integer
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
  end component;

  signal fdp : data_array (0 to NUM_OPERANDS/2 - 1);
begin
  MOAStage_inst : MOAStage
    generic map(
      BITWIDTH     => BITWIDTH,
      NUM_OPERANDS => NUM_OPERANDS,
      SUM_WIDTH    => SUM_WIDTH
      )
    port map(
      clk       => clk,
      reset_n   => reset_n,
      enable    => enable,
      in_data   => in_data,
      in_valid  => in_valid,
      out_data  => out_data,
      out_valid => fdp
      );
      out_data <= fdp(0);
end architecture;
