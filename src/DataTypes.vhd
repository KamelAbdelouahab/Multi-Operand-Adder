library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_signed.all;
    use ieee.math_real.all;

package DataTypes is
    constant CONST_DATA_WIDTH     : natural := 4;                                -- Bitwidth
    constant CONST_NUM_OPERANDS   : natural := 64;                    -- Number of operands
    constant CONST_REG_STRIDE     : natural := 3;                -- Stride between registers
    constant MAX_PIPLINE_STAGES   : natural := natural(ceil(log2(real(CONST_NUM_OPERANDS))));
    constant CONST_PIPLINE_STAGES : natural := MAX_PIPLINE_STAGES;         -- Pipeline depth
    type data_array is array (natural range <>) of std_logic_vector (CONST_DATA_WIDTH-1 downto 0);
end package DataTypes;
