library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
library work;
use work.DataTypes.all;

entity SOA is
  generic(
    BITWIDTH : integer := CONST_DATA_WIDTH
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
end entity;


architecture rtl of SOA is
begin
  add_proc : process(clk)
  begin
    if (reset_n = '0') then
      out_valid <= '0';
      out_data  <= (others => '0');

    elsif (rising_edge(clk)) then
      if (enable = '1') then
        if (in_valid = '1') then
          out_data <= in_op1 + in_op2;
        else
          out_data  <= (others => '0');
        end if;
        out_valid <= in_valid;
      end if;
    end if;
  end process;

end architecture;
