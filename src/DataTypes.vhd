library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_signed.all;
    use ieee.math_real.all;

package DataTypes is
    constant CONST_DATA_WIDTH     : natural := 4;    -- Bitwidth
<<<<<<< HEAD
    constant CONST_NUM_OPERANDS   : natural := 128;  -- Number of operands 
    constant CONST_PIPLINE_STAGES : natural := 1;    -- Pipeline depth
    constant MAX_PIPLINE_STAGES   : natural := natural(ceil(log2(real(CONST_NUM_OPERANDS))));  -- log2(128)=7
=======
    constant CONST_NUM_OPERANDS   : natural := 128;  -- Number of operands
    constant MAX_PIPLINE_STAGES   : natural := natural(ceil(log2(real(CONST_NUM_OPERANDS))));
    constant CONST_PIPLINE_STAGES : natural := MAX_PIPLINE_STAGES;    -- Pipeline depth
>>>>>>> 71557fd5ffe2eaeba00036ce38043807b47268b2
    constant CONST_SUM_WIDTH      : natural := CONST_DATA_WIDTH + natural(ceil(log2(real(CONST_NUM_OPERANDS))));
    type data_array is array (natural range <>) of std_logic_vector (CONST_DATA_WIDTH-1 downto 0);
    type sum_array  is array (natural range <>) of std_logic_vector (CONST_SUM_WIDTH-1 downto 0);
end package DataTypes;
