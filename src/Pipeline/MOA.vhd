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
    SUM_WIDTH      : integer := CONST_SUM_WIDTH;
    PIPLINE_STAGES : integer := CONST_PIPLINE_STAGES
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
      SUM_WIDTH    : integer
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

  type data_array_2d is array (natural range <>) of data_array (0 to NUM_OPERANDS - 1);
  signal between_moa_stage : data_array_2d (0 to PIPLINE_STAGES-1)    := (others => (others => (others => '0')));
  -- This joke refers to Nicole Kidmans' horror movie : the others ...
  signal valids            : std_logic_vector (0 to PIPLINE_STAGES-1) := (others => '0');
  signal s_acc             : std_logic_vector (BITWIDTH-1 downto 0)   := (others => '0');

  constant MAX_PIPELINE_STAGES : integer := natural(ceil(log2(real(CONST_NUM_OPERANDS))));

begin
  piplined_MOA : for i in 0 to PIPLINE_STAGES-1 generate
    MOA_stage_0 : if i=0 generate
      MOAStage_inst_0 : MOAStage
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
          out_data  => between_moa_stage(1)(0 to NUM_OPERANDS/2 -1),
          out_valid => valids(1)
          );
    end generate MOA_stage_0;

    MOA_stage_i : if i>0 and i<PIPLINE_STAGES-1 generate
      MOAStage_inst_i : MOAStage
        generic map(
          BITWIDTH     => BITWIDTH,
          NUM_OPERANDS => NUM_OPERANDS/(2**i),
          SUM_WIDTH    => SUM_WIDTH
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
    end generate MOA_stage_i;

    -- MOA_stage_f : if i=PIPLINE_STAGES-1 generate
    --   MOAStage_inst_i : MOAStage
    --     generic map(
    --       BITWIDTH     => BITWIDTH,
    --       NUM_OPERANDS => NUM_OPERANDS/(2**i),
    --       SUM_WIDTH    => SUM_WIDTH
    --       )
    --     port map(
    --       clk       => clk,
    --       reset_n   => reset_n,
    --       enable    => enable,
    --       in_data   => between_moa_stage(i)(0 to NUM_OPERANDS/(2**i) -1),
    --       in_valid  => valids(i),
    --       out_data(0) => out_data,
    --       out_valid => out_valid
    --       );
    --
    -- end generate MOA_stage_f;
  end generate piplined_MOA;


  not_pipelined_proc : process(clk)
  variable v_acc : std_logic_vector (BITWIDTH-1 downto 0) := (others=>'0');
  begin
    if (reset_n = '0') then
      v_acc := (others=>'0');
      out_valid <= '0';

    elsif (rising_edge(clk)) then
      if (enable='1') then
        if (valids(PIPLINE_STAGES-1) = '1') then
          acc_loop : for n in 0 to NUM_OPERANDS/(2**MAX_PIPELINE_STAGES) - 1  loop
            v_acc := v_acc + between_moa_stage(PIPLINE_STAGES-1)(n);
          end loop acc_loop;
        end if;
      end if;
      s_acc <= v_acc;
      v_acc := (others=>'0');
      out_valid <= valids(PIPLINE_STAGES-1);
    end if;
  end process;
  out_data <= s_acc;

end architecture;
