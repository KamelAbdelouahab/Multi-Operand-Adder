library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
library work;
use work.DataTypes.all;

entity MOAStage is
  generic(
    BITWIDTH     : integer;
    NUM_OPERANDS : integer;
    PIPELINE     : string
    );
  port(
    clk       : in     std_logic;
    reset_n   : in     std_logic;
    enable    : in     std_logic;
    in_data   : in     data_array (0 to NUM_OPERANDS - 1);
    in_valid  : in     std_logic;
    out_data  : buffer data_array (0 to NUM_OPERANDS/2 - 1);
    out_valid : buffer std_logic
    );
end entity;


architecture rtl of MOAStage is
  component SOA is
    generic(
      BITWIDTH : integer;
      PIPELINE : string
      );
    port(
      clk       : in     std_logic;
      reset_n   : in     std_logic;
      enable    : in     std_logic;
      in_op1    : in     std_logic_vector (BITWIDTH-1 downto 0);
      in_op2    : in     std_logic_vector (BITWIDTH-1 downto 0);
      in_valid  : in     std_logic;
      out_data  : buffer std_logic_vector (BITWIDTH-1 downto 0);
      out_valid : buffer std_logic
      );
  end component;
begin

  adder_gen : for i in 0 to (NUM_OPERANDS/2 - 1) generate
    adder_gen_last: if i= (NUM_OPERANDS/2 - 1) generate
	 last_soa: SOA
      generic map(
        BITWIDTH => BITWIDTH,
        PIPELINE => PIPELINE
        )
      port map(
        clk       => clk,
        reset_n   => reset_n,
        enable    => enable,
        in_op1    => in_data(i),
        in_op2    => in_data(NUM_OPERANDS - i - 1),
        in_valid  => in_valid,
        out_data  => out_data(i),
        out_valid => out_valid
        );
	 end generate adder_gen_last;

    adder_gen_i : if i >= 0 and i < (NUM_OPERANDS/2 - 1) generate
    inst_soa : SOA
      generic map(
        BITWIDTH => BITWIDTH,
		  PIPELINE => PIPELINE
        )
      port map(
        clk       => clk,
        reset_n   => reset_n,
        enable    => enable,
        in_op1    => in_data(i),
        in_op2    => in_data(NUM_OPERANDS - i - 1),
        in_valid  => in_valid,
        out_data  => out_data(i),
        out_valid => OPEN
        );
	  end generate adder_gen_i;
  end generate adder_gen;

end architecture;
