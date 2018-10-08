library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.math_real.all;
library work;
use work.DataTypes.all;

entity MOA is
  generic(
    BITWIDTH       : integer := CONST_DATA_WIDTH;
    NUM_OPERANDS   : integer := CONST_NUM_OPERANDS;
    PIPLINE_STAGES : integer := MAX_PIPLINE_STAGES;
    REG_STRIDE     : integer := CONST_REG_STRIDE
    );
  port(
    clk       : in  std_logic;
    reset_n   : in  std_logic;
    enable    : in  std_logic;
    in_data   : in  data_array (0 to NUM_OPERANDS - 1);
    in_valid  : in  std_logic;
    out_data  : out std_logic_vector (BITWIDTH-1 downto 0);
    out_valid : out std_logic
    );
end MOA;


architecture rtl of MOA is
  component MOAStage is
    generic(
      BITWIDTH     : integer;
      NUM_OPERANDS : integer;
      PIPELINE     : string
      );
    port(
      clk       : in  std_logic;
      reset_n   : in  std_logic;
      enable    : in  std_logic;
      in_data   : in  data_array (0 to NUM_OPERANDS - 1);
      in_valid  : in  std_logic;
      out_data  : buffer data_array (0 to NUM_OPERANDS/2 - 1);
      out_valid : buffer std_logic
      );
  end component;

  signal valids            : std_logic_vector (1 to PIPLINE_STAGES)   := (others => '0');
  type data_array_2d is array (natural range <>) of data_array (0 to NUM_OPERANDS - 1);
  signal between_moa_stage : data_array_2d (1 to PIPLINE_STAGES)    := (others => (others => (others => '0')));
  -- This joke refers to Nicole Kidmans' horror movie : the others ...

begin
  piplined_MOA : for i in 0 to PIPLINE_STAGES-1 generate
    MOA_stage_0 : if i=0 generate
      MOAStage_inst_0 : MOAStage
        generic map(
          BITWIDTH     => BITWIDTH,
          NUM_OPERANDS => NUM_OPERANDS,
          PIPELINE     => "OFF"
          )
        port map(
          clk       => clk,
          reset_n   => reset_n,
          enable    => enable,
          in_data   => in_data,
          in_valid  => in_valid,
          out_data  => between_moa_stage(1)(0 to NUM_OPERANDS/2 -1),
          out_valid => valids(1)
          );
    end generate MOA_stage_0;

    MOA_stage_i : if i>0 and i<PIPLINE_STAGES-1 generate
      MOA_PIPELINED : if (i mod REG_STRIDE = 0) generate
        MOAStage_pipelined_i : MOAStage
          generic map(
            BITWIDTH     => BITWIDTH,
            NUM_OPERANDS => NUM_OPERANDS/(2**i),
            PIPELINE     => "ON"
            )
          port map(
            clk       => clk,
            reset_n   => reset_n,
            enable    => enable,
            in_data   => between_moa_stage(i)(0 to NUM_OPERANDS/(2**i) -1),
            in_valid  => valids(i),
            out_data  => between_moa_stage(i+1)(0 to NUM_OPERANDS/(2**(i+1)) -1),
            out_valid => valids(i+1)
            );
      else generate
        MOAStage_NOTpipelined_i : MOAStage
          generic map(
            BITWIDTH     => BITWIDTH,
            NUM_OPERANDS => NUM_OPERANDS/(2**i),
            PIPELINE     => "OFF"
            )
          port map(
            clk       => clk,
            reset_n   => reset_n,
            enable    => enable,
            in_data   => between_moa_stage(i)(0 to NUM_OPERANDS/(2**i) -1),
            in_valid  => valids(i),
            out_data  => between_moa_stage(i+1)(0 to NUM_OPERANDS/(2**(i+1)) -1),
            out_valid => valids(i+1)
            );
      end generate;
    end generate MOA_stage_i;

    MOA_stage_f : if i=PIPLINE_STAGES-1 generate
      MOAStage_inst_i : MOAStage
        generic map(
          BITWIDTH     => BITWIDTH,
          NUM_OPERANDS => NUM_OPERANDS/(2**i),
          PIPELINE     => "OFF"
          )
        port map(
          clk       => clk,
          reset_n   => reset_n,
          enable    => enable,
          in_data   => between_moa_stage(i)(0 to NUM_OPERANDS/(2**i) -1),
          in_valid  => valids(i),
          out_data  => between_moa_stage(PIPLINE_STAGES)(0 to NUM_OPERANDS/(2**(i+1)) -1),
          out_valid => out_valid
          );
    end generate MOA_stage_f;
  end generate piplined_MOA;
  out_data <= between_moa_stage(PIPLINE_STAGES)(0 to NUM_OPERANDS/(2**PIPLINE_STAGES) -1)(0);
end architecture;
