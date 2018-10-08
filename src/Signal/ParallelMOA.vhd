library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_signed.all;

library work;
    use work.DataTypes.all;

entity ParallelMOA is
  generic(
    BITWIDTH       : integer := CONST_DATA_WIDTH;
    NUM_OPERANDS   : integer := CONST_NUM_OPERANDS;
    SUM_WIDTH      : integer := CONST_SUM_WIDTH;
    PIPLINE_STAGES : integer := MAX_PIPLINE_STAGES
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
end entity ParallelMOA;

architecture Bhv of ParallelMOA is
-----------------------------
-- SIGNALS
-----------------------------
signal pip_acc : data_array (0 to NUM_OPERANDS - 1) := (others => (others => '0'));
begin
  process(clk)
  begin
    if (reset_n = '0') then
      pip_acc   <= (others => (others => '0'));
      out_valid <= '0';

    elsif(rising_edge(clk)) then
      if (enable = '1') then
        if (in_valid = '1') then
          pip_acc(0)(BITWIDTH-1 downto 0) <= in_data(0);
          acc_loop : for i in 1 to NUM_OPERANDS-1 loop
            pip_acc(i) <= pip_acc(i-1) + in_data(i);
          end loop acc_loop;
        else
          pip_acc   <= (others => (others => '0'));
        end if;
        out_data <= pip_acc(NUM_OPERANDS-1);
        out_valid <= in_valid;
      end if;
    end if;
  end process;
end architecture Bhv;
