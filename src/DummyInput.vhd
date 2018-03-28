library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_signed.all;

library work;
    use work.DataTypes.all;

entity DummyInput is
  generic (
  DATA_WIDTH   : natural := CONST_DATA_WIDTH;
  NUM_OPERANDS : natural := CONST_NUM_OPERANDS
  );
  port(
  in_data  : in  std_logic_vector(DATA_WIDTH-1 downto 0);
  out_data : out data_array (0 to NUM_OPERANDS-1)
  );
end entity;

architecture dummy of DummyInput is
  begin
  gen : for i in 0 to NUM_OPERANDS-1 generate
    out_data(i) <= in_data;
  end generate gen;
end architecture;
