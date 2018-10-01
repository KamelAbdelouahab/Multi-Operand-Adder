library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_signed.all;
    use ieee.math_real.all;

package DataTypes is
    constant CONST_DATA_WIDTH     : natural := 4;    -- Bitwidth
    constant CONST_NUM_OPERANDS   : natural := 128;  -- Number of operands
    constant CONST_PIPLINE_STAGES : natural := 5;    -- Pipeline depth
    constant CONST_SUM_WIDTH      : natural := CONST_DATA_WIDTH + natural(ceil(log2(real(CONST_NUM_OPERANDS))));
    type data_array is array (natural range <>) of std_logic_vector (CONST_DATA_WIDTH-1 downto 0);
    type sum_array is array (natural range <>) of std_logic_vector (CONST_SUM_WIDTH-1 downto 0);
end package DataTypes;
