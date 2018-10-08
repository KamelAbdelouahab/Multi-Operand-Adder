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

  signal s_acc             : std_logic_vector (BITWIDTH-1 downto 0)   := (others => '0');

begin

  not_pipelined_proc : process(clk)
  variable v_acc : std_logic_vector (BITWIDTH-1 downto 0) := (others=>'0');

  begin
    if (reset_n = '0') then
      v_acc := (others=>'0');
      out_valid <= '0';

    elsif (rising_edge(clk)) then
      if (enable='1') then
        if (in_valid = '1') then
          acc_loop : for i in 0 to NUM_OPERANDS - 1  loop
            v_acc := v_acc + in_data(i);
          end loop acc_loop;
        end if;
      end if;
      s_acc     <= v_acc;
      v_acc     := (others => '0');
      out_valid <= in_valid;
    end if;
  end process;
  out_data <= s_acc;

end architecture;
